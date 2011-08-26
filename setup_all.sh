#!/bin/sh
rm -rf ~/.vim
rm -f ~/.vimrc
touch ~/.profile
sh ~/dotfiles/bash/setup_bash.sh
sh ~/dotfiles/vim/setup_vim.sh
