call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-sleuth')
call dein#add('Raimondi/delimitMate')
call dein#add('blueyed/vim-diminactive')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('rickhowe/diffchar.vim')
call dein#add('tarekbecker/vim-yaml-formatter')
call dein#add('derekwyatt/vim-fswitch')



call dein#add('Shougo/denite.nvim')
call dein#add('rafi/vim-denite-z')
call dein#add('neoclide/denite-extra')
"call dein#add('neoclide/denite-git')
call dein#add('~/code/forks/denite-git')
call dein#add('Shougo/neomru.vim')
call dein#add('mbbill/undotree')
call dein#add('Shougo/defx.nvim')
call dein#add('kristijanhusak/defx-git')
call dein#add('kristijanhusak/defx-icons')


call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('easymotion/vim-easymotion')
call dein#add('scrooloose/nerdcommenter')
call dein#add('Shougo/vimshell')
call dein#add('itchyny/lightline.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/deoplete.nvim')
call dein#add('ervandew/supertab')
call dein#add('haya14busa/incsearch.vim')
call dein#add('haya14busa/incsearch-fuzzy.vim')
call dein#add('t9md/vim-choosewin')

call dein#add('bfrg/vim-cpp-modern')
call dein#add('sakhnik/nvim-gdb', {
                  \'build': './install.sh'
                  \})
call dein#add('autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'build': 'bash install.sh',
      \ })


call dein#add('kassio/neoterm')
call dein#add('janko-m/vim-test')

"Haskell
call dein#add('parsonsmatt/intero-neovim')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('alx741/vim-hindent')

"Swift
call dein#add('keith/swift.vim')
"call dein#add('neomake/neomake')
"call dein#add('landaire/deoplete-swift')
"call dein#add('~/Dropbox/shared_code/vex/vex-complete')
