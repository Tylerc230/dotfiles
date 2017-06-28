rmdir ~/.cache
mkdir -p ~/.cache/dein
brew install python3
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
brew install neovim
pip3 install neovim
ln -s ~/dotfiles/nvim/nvim ~/.config/nvim
