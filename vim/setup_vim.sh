brew install vim
brew install reattach-to-user-namespace
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
ln -s ~/dotfiles/vim/vimrc.before.fork ~/.vimrc.before.fork
ln -s ~/dotfiles/vim/vimrc.bundles.local ~/.vimrc.before.fork
rm ~/.vimrc.local
ln -s ~/dotfiles/vim/vimrc.local ~/.vimrc.local

