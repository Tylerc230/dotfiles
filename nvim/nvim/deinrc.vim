"Scripts-----------------------------
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  so ~/.config/nvim/plugins.vim

  " Required:
  call dein#end()
  call dein#save_state()
endif

"End dein Scripts-------------------------
