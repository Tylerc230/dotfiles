if &compatible
  set nocompatible               " Be iMproved
endif
so ./deinrc
" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

