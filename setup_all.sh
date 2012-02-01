#!/bin/sh
rm -rf ~/.vim
rm -f ~/.vimrc
touch ~/.profile
sh ~/dotfiles/bash/setup_bash.sh
sh ~/dotfiles/vim/setup_vim.sh
sh ~/dotfiles/zsh/setup_zsh.sh
pushd ~/dotfiles/vim/bundles/command-t/ruby/command-t/
rvm use system
ruby extconf.rb
make
popd
