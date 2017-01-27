if &compatible
  set nocompatible               " Be iMproved
endif
so ~/.config/nvim/deinrc.vim
" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
let mapleader="\<SPACE>"
set timeoutlen=1000 ttimeoutlen=0 "remove delay after tapping escape
let g:vimfiler_as_default_explorer = 1

"mappings
nmap <silent> <leader>f :VimFilerExplorer<CR>
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l

