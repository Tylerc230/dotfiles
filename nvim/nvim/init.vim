if &compatible
  set nocompatible               " Be iMproved
endif
set hidden
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
so ~/.config/nvim/deinrc.vim
"Required:
filetype plugin indent on
filetype plugin on
syntax enable
set clipboard=unnamed

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set background=dark
colors gruvbox
"colors anderson
"colors flattened_dark
"colors hybrid
"colors hybrid_material
"colors OceanicNext
hi ColorColumn ctermbg=0 guibg=#363636
set laststatus=2
"For gitgutter
set updatetime=250
let g:gitgutter_map_keys = 0
set spell spelllang=en_us
hi SpellBad gui=underline guifg=red                                 
so ~/.config/nvim/statusline.vim                                    
                                                                    
"settings                                                           
let mapleader="\<SPACE>"                                            
set timeoutlen=1000 ttimeoutlen=0 "remove delay after tapping escape

let g:EasyMotion_do_mapping = 1
set nowrap
set termguicolors

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
set exrc                " Source _nvimrc in local folder
set undofile " Maintain undo history between sessions
set undodir=~/.cache/undodir
set signcolumn=yes

":Topen open the terminal
":Ttoggle toggle
autocmd BufLeave term://* stopinsert
autocmd BufEnter term://* call fugitive#detect(@%)
autocmd FileType neoterm  set nospell
autocmd FileType denite  set nospell
autocmd FileType fugitive set spell

au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile *.podspec set filetype=ruby
autocmd BufNewFile,BufRead *.swift set filetype=swift
" When editing a file, always jump to the last cursor position
if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
     \ endif
endif

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore '
let g:unite_source_grep_recursive_opt = ''
let g:goldenview__enable_default_mapping = 0

" Use deoplete.                                                     
let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
let g:LanguageClient_loggingFile = expand('~/.config/nvim/LanguageClient.log')
let g:LanguageClient_loggingLevel = "DEBUG"

let g:deoplete#enable_at_startup = 1                                
call deoplete#custom#option('auto_complete_delay', 250)
"call deoplete#enable_logging('DEBUG', 'deoplete.log')
"call deoplete#custom#option('profile', v:true)

      "\'cpp': ['~/tools/cquery/build/cquery', '--log-file=/tmp/cq.log'],
      "\'c': ['~/tools/cquery/build/cquery', '--log-file=/tmp/cq.log'],
      "\'objc': ['~/tools/cquery/build/cquery', '--log-file=/tmp/cq.log'],
let g:LanguageClient_serverCommands = {
      \'python': ['/usr/local/bin/pyls'],
      \'swift': ['~/Desktop/vim_lsp/sourcekit-lsp/.build/debug/sourcekit-lsp'],
      \}
let g:LanguageClient_rootMarkers = {
      \ 'swift': ['Package.swift'],
      \ }

let g:delimitMate_expand_cr = 0
inoremap <expr> <Esc> pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"
imap <expr> <CR>  pumvisible() ? "\<C-y>" : "<Plug>delimitMateCR"
"Terminal stuff
tnoremap <ESC> <C-\><C-n>
"tnoremap <leader>h <C-\><C-n><C-w>h
"tnoremap <leader>j <C-\><C-n><C-w>j
"tnoremap <leader>k <C-\><C-n><C-w>k
"tnoremap <leader>l <C-\><C-n><C-w>l
"autocmd BufWinEnter,WinEnter term://* startinsert
"navigation
nnoremap <C-i> <C-o>
nnoremap <C-o> <C-i>
cnoreabbrev wb w <bar> bp <bar> bd #
"windows
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>w :ChooseWin<cr>
" resize current buffer by +/- 5 
nnoremap <C-right> :vertical resize +5<cr>
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>

nmap <silent> <leader>f :Defx -columns=git:mark:filename:type -split=vertical -winwidth=50 -direction=topleft -auto-cd -buffer-name="Defx" -toggle -resume -listed<CR>
nmap <silent> <leader>F :Defx `expand('%:p:h')` -search=`expand('%:p')` -columns=git:mark:filename:type -split=vertical -winwidth=50 -direction=topleft -auto-cd -buffer-name="Defx" -toggle -listed <CR>
nmap <silent> <leader>r :Denite -buffer-name=MRU file_mru<CR>
nmap <silent> <leader>t :Denite -buffer-name=CTRLP file/rec<CR>
nmap <silent> <leader>/ :Denite grep:.<CR>
nmap <silent> <leader>? :Denite grep:.:-s<CR>
nmap <silent> <leader>z :Denite z -sorters=""<CR>
nmap <silent> <leader>gs :Gstatus <bar>wincmd T<bar>set previewwindow<CR>
map <silent> <leader>gla :Denite gitlog:all -mode=normal -auto-resume -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gll :Denite gitlog -mode=normal -auto-resume -vertical-preview -sorters=""<CR>
nmap <silent> <leader>gb :Denite gitbranch -auto-resume -vertical-preview -sorters=""<CR>

nmap <silent> U :UndotreeToggle<cr>
"format selection
nmap <silent> <leader>i V=<ESC> 
vmap <silent> <leader>i =
nmap <silent> <leader>v :Ttoggle<CR>
"copy file path to clipboard
nmap <silent> <leader>cp :let @+ = expand("%")<cr>


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map f/ <Plug>(incsearch-fuzzy-/)
map f? <Plug>(incsearch-fuzzy-?)
map fg/ <Plug>(incsearch-fuzzy-stay)

let test#strategy = 'neoterm'
let test#python#runner = 'pytest'
let g:test#python#pytest#options = '-s'



let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_open_in_all_tabs = 1 "open an new terminal for each tab instead of using the same one
let g:neoterm_term_per_tab = 1 "send commands to current tab terminal instead of last active
nmap <silent> <leader>n :vert Tnew<CR>

nnoremap <silent> <leader>U :TestNearest<CR>
nnoremap <silent> <leader>u :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>


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
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap' )
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap' )
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('file_mru', 'sorters', [])
call denite#custom#source('file_mru', 'matchers', ['matcher/cpsm'])
call denite#custom#source('file_rec', 'sorters', ['sorter/rank'])
call denite#custom#source('file_rec', 'matchers', ['matcher/cpsm'])
call denite#custom#source('gitlog', 'sorters', [])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
hi Search gui=NONE guibg=#606060 guifg=NONE
set guicursor+=a:blinkon1
hi! link IncSearch Search

"cabbrev wqa <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w\|close' : 'wqa')<CR>
"cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>

"nvr
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif


"vex
"nnoremap <Tab> /<#<CR>:nohlsearch<cr>va<
"vnoremap <Tab> <Esc>/<#<CR>:nohlsearch<cr>va<
"autocmd BufReadPost *.swift call deoplete#enable_logging('DEBUG', 'deoplete.log')
"autocmd BufReadPost *.swift call deoplete#custom#source('Swift', 'debug_enabled', 1)

function ShowGstatus()
  execute "Gstatus | wincmd T | set previewwindow"
  "execute "tab Gstatus"
endfunction

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> gi :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> <leader>gm :Denite contextMenu<cr>
    nnoremap <buffer> <silent> <leader>m :Denite documentSymbol<cr>
    nnoremap <buffer> <silent> <leader>gr :Denite references<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()
"intero
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>it <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>iT <Plug>InteroType
  "au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>gd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

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



