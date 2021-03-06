"Scripts-----------------------------
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/dotfiles/nvim/nvim/bin

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  so ~/.config/nvim/plugins.vim
  so ~/.config/nvim/colorschemes.vim

  " Required:
  call dein#end()
  call dein#save_state()
endif

"End dein Scripts-------------------------
