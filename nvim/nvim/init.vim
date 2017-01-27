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
set timeoutlen=1000 ttimeoutlen=0 "remove delay after tapping escape
let g:vimfiler_as_default_explorer = 1

