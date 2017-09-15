if &compatible
  set nocompatible               " Be iMproved
endif
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
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_filters = ['matcher_ignore_pattern']

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

au BufRead,BufNewFile Podfile set filetype=ruby
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
let g:deoplete#enable_at_startup = 1
inoremap <expr><ESC>  pumvisible() ? deoplete#smart_close_popup() : "\<ESC>"
call deoplete#enable_logging('DEBUG', 'deoplete.log')
"Terminal stuff
tnoremap <ESC><ESC> <C-\><C-n>
"tnoremap <leader>h <C-\><C-n><C-w>h
"tnoremap <leader>j <C-\><C-n><C-w>j
"tnoremap <leader>k <C-\><C-n><C-w>k
"tnoremap <leader>l <C-\><C-n><C-w>l
"autocmd BufWinEnter,WinEnter term://* startinsert
"mappings
nmap <C-h> <C-o>
nmap <C-l> <C-i>
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l
noremap <C-n> <C-o>
noremap <C-m> <C-i>
nmap <silent> <leader>f :VimFilerExplorer<CR>
nmap <silent> <leader>r :Denite -buffer-name=MRU file_mru unite:directory_mru<CR>
nmap <silent> <leader>t :Denite -buffer-name=CTRLP file_rec<CR>
nmap <silent> <leader>/ :Denite grep:.<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gl :Gitv<CR>
nmap <silent> <leader>s <Plug>GoldenViewSplit
nmap <silent> <leader>m <Plug>GoldenViewSwitchMain
nmap <silent> <leader>i V=<ESC>
vmap <silent> <leader>i =
nmap <silent> <leader>eb :VimFilerBuffer -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map f/ <Plug>(incsearch-fuzzy-/)
map f? <Plug>(incsearch-fuzzy-?)
map fg/ <Plug>(incsearch-fuzzy-stay)

let test#strategy = 'neoterm'
let g:test#python#pytest#options = '-s'

nnoremap <silent> <leader>U :TestNearest<CR>
nnoremap <silent> <leader>u :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

autocmd FileType vimfiler call s:unite_settings()
autocmd FileType vimfiler call s:vimfiler_settings()
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  unmap <buffer> <Space>
endfunction

function! s:vimfiler_settings()
  unmap <buffer> E
  nmap <buffer> <silent> s <Plug>(vimfiler_split_edit_file)
  nmap <buffer> <Enter> o
  nmap <buffer> cd <Plug>(vimfiler_cd_or_edit)
endfunction

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap' )
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap' )
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
autocmd! BufWritePost,BufEnter * Neomake
hi Search gui=NONE guibg=#606060 guifg=NONE
set guicursor+=a:blinkon1
hi! link IncSearch Search

"vex
nnoremap <Tab> /<#<CR>:nohlsearch<cr>va<
vnoremap <Tab> <Esc>/<#<CR>:nohlsearch<cr>va<
autocmd BufReadPost *.swift call deoplete#enable_logging('DEBUG', 'deoplete.log')
autocmd BufReadPost *.swift call deoplete#custom#source('Swift', 'debug_enabled', 1)

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
  " Manually save and reload
  "au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  "au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

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

