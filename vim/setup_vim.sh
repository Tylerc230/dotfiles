brew install vim
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
ln -s ~/dogenerictfiles/vim/vimrc ~/.vimrc
pushd ~/dotfiles/
git submodule init
git submodule update
