"denite


nmap <silent> <leader>r :Denite -buffer-name=MRU file_mru<CR>
nmap <silent> <leader>t :Denite -buffer-name=CTRLP file/rec<CR>
nmap <silent> <leader>/ :Denite grep:.<CR>
nmap <silent> <leader>? :Denite grep:.:-s<CR>
nmap <silent> <leader>z :Denite z -sorters=""<CR>
map <silent> <leader>gla :Denite gitlog:all -mode=normal -auto-resume -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gll :Denite gitlog -mode=normal -auto-resume -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gb :Denite gitbranch -auto-resume -vertical-preview -sorters=""<CR>
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
      \ 'split': 'floating',
      \ 'start_filter': 1,
      \ 'auto_resize': 1,
      \ 'source_names': 'short',
      \ 'direction': 'botright',
      \ 'highlight_filter_background': 'CursorLine',
      \ 'highlight_matched_char': 'Type',
      \ 'reversed': 'true',
      \ }
call denite#custom#option('default', s:denite_options)
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap' )
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap' )
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('file_mru', 'sorters', ['sorter/rank'])
call denite#custom#source('file_mru', 'matchers', ['matcher/cpsm'])
"call denite#custom#source('file/rec', 'sorters', ['sorter/rank'])
call denite#custom#source('file/rec', 'matchers', ['converter/tail_path', 'matcher/fuzzy'])
call denite#custom#source('gitlog', 'sorters', [])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

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



"defx
nmap <silent> <leader>f :Defx -columns=git:mark:filename:type -split=vertical -winwidth=50 -direction=topleft -buffer-name="Defx" -toggle -resume -listed -auto-cd <CR>
nmap <silent> <leader>F :Defx `expand('%:p:h')` -search=`expand('%:p')` -columns=git:mark:filename:type -split=vertical -winwidth=50 -direction=topleft -auto-cd -buffer-name="Defx" -toggle -listed <CR>
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



