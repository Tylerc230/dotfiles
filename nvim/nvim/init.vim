if &compatible
  set nocompatible               " Be iMproved
endif
so ~/.config/nvim/deinrc.vim
"Required:
filetype plugin indent on
filetype plugin on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"settings
let mapleader="\<SPACE>"
set timeoutlen=1000 ttimeoutlen=0 "remove delay after tapping escape
let g:vimfiler_as_default_explorer = 1
let g:EasyMotion_do_mapping = 1

" When editing a file, always jump to the last cursor position
if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
     \ endif
endif

"mappings
nmap <silent> <leader>f :VimFilerExplorer<CR>
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l
nmap <silent> <leader>s :Gstatus<CR>

