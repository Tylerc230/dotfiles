"denite


nmap <silent> <leader>r :Denite -no-start-filter -buffer-name=MRU file_mru<CR>
nmap <silent> <leader>t :Denite -buffer-name=CTRLP file/rec<CR>
nmap <silent> <leader>b :Denite -buffer-name=Buffers -no-start-filter buffer<CR>
nmap <silent> <leader>/ :Denite grep:.<CR>
nmap <silent> <leader>? :Denite grep:.:-s<CR>
nmap <silent> <leader>zz :Denite z -sorters=""<CR>
nmap <silent> <leader>e :Denite quickfix -no-start-filter -buffer-name=quickfix -sorters=""<CR>
nmap <silent> <leader>zh :Denite zsh_history -unique -no-start-filter -buffer-name="zsh history"<CR>
nmap <silent> <leader>gll :Denite gitlog:all -no-start-filter  -vertical-preview -sorters=""<CR>
nmap <silent> <leader>glf :Denite gitlog -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gc :Denite gitchanged -no-start-filter  -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gb :Denite gitbranch -no-start-filter -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gf :Denite gitfiles -vertical-preview -sorters=""<CR>
autocmd FileType denite-filter call deoplete#custom#buffer_option('auto_complete', v:false)

call denite#custom#map(
      \ 'normal',
      \ '<Space>j',
      \ '<denite:wincmd:j>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'normal',
      \ '<Space>h',
      \ '<denite:wincmd:h>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'normal',
      \ '<Space>k',
      \ '<denite:wincmd:k>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'normal',
      \ '<Space>l',
      \ '<denite:wincmd:l>',
      \ 'noremap'
      \)
let s:denite_options = {
      \ 'prompt' : '❯',
      \ 'split': 'horizontal',
      \ 'empty': v:false,
      \ 'start_filter': 1,
      \ 'auto_resize': 1,
      \ 'source_names': 'short',
      \ 'direction': 'botright',
      \ 'highlight_filter_background': 'CursorLine',
      \ 'highlight_matched_char': 'Type',
      \ }
call denite#custom#option('_', s:denite_options)
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap' )
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap' )
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('file/rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_mru', 'matchers', ['converter/tail_path', 'matcher/fuzzy'])
call denite#custom#source('file/rec', 'matchers', ['matcher/hide_hidden_files','converter/tail_path', 'matcher/fuzzy'])
call denite#custom#source('gitfiles', 'matchers', ['converter/tail_path', 'matcher/fuzzy'])
call denite#custom#source('gitlog', 'sorters', [])
call denite#custom#source('gitlog', 'default_action', 'check_out')

call denite#custom#alias('source', 'zsh_history', 'output')
"histlist returns '<num> <cmd>' so can't unique it.
call denite#custom#source('zsh_history', 'args', ['!hist_list.sh'])
call denite#custom#source('zsh_history', 'sorters', [])
call denite#custom#source('zsh_history', 'matchers', ['matcher/substring'])
call denite#custom#source('zsh_history', 'max_candidates', 100000)
call denite#custom#source('zsh_history', 'default_action', 'send_to_shell')
let g:historyRegex = ' *\([0-9]\+\)  \(.*\)'
function! s:send_to_shell(context)
  let numberAndCommand = a:context['targets'][0]['word']
  let command = substitute(numberAndCommand, g:historyRegex, '\2', '')
  echom "executing ".command
  execute "T  ".command
endfunction

function! s:edit_in_shell(context)
  let numberAndCommand = a:context['targets'][0]['word']
  let historyNumber = substitute(numberAndCommand, g:historyRegex, '\1', '')
  echom "editing ".historyNumber
  execute "T  !".historyNumber
endfunction

call denite#custom#action('word', 'send_to_shell', function('s:send_to_shell'))
call denite#custom#action('word', 'edit_in_shell', function('s:edit_in_shell'))

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

function! s:check_out(context)
  let commit = a:context['targets'][0].source__commit
  echom "checkout ".commit
  execute "!git checkout ".commit
endfunction
call denite#custom#action('gitlog', 'check_out', function('s:check_out'))
call denite#custom#map(
      \ 'normal',
      \ 'C',
      \ '<denite:do_action:check_out>',
      \ 'noremap'
      \)



autocmd FileType denite call s:denite_my_settings()
"https://github.com/Shougo/denite.nvim/issues/654#issuecomment-502355991
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> T denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> h denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <nowait> <silent><buffer><expr> y denite#do_map('do_action', 'yank')
  nnoremap <silent><buffer><expr> c denite#do_map('do_action', 'cd')
  nnoremap <silent><buffer><expr> e denite#do_map('do_action', 'edit')
  nnoremap <nowait> <silent><buffer><expr> o denite#do_map('do_action', 'drop')
  nnoremap <silent><buffer><expr> V denite#do_map('toggle_select')
  nnoremap <silent><buffer><expr> <space> denite#do_map('toggle_select').'j'
endfunction
"defx
nmap <silent> <leader>f :Defx -split=vertical -winwidth=50 -direction=topleft -toggle -resume -listed <CR>
nmap <silent> <leader>F :Defx `expand('%:p:h')` -search=`expand('%:p')`  -split=vertical -winwidth=50 -direction=topleft -toggle -listed<CR>

call defx#custom#option('_', {
      \ 'columns': 'git:mark:indent:icons:filename:type:size:time',
      \ })
call defx#custom#column('mark', {
      \ 'directory_icon': '',
      \ 'readonly_icon': '',
      \ 'selected_icon': '✭',
      \ })
let g:defx_git#indicators = {
  \ 'Modified'  : '',
  \ 'Staged'    : '',
  \ 'Untracked' : '',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '',
  \ 'Unknown'   : '?'
  \ }
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
set nospell
  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'git:mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> <BS> defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

