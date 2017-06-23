#!/bin/sh
rm -f ~/.config
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
mkdir ~/.config
sh ~/dotfiles/zsh/setup_zsh.sh
sh ~/dotfiles/nvim/setup_nvim.sh
sh ~/dotfiles/tmux/setup_tmux.sh
sh ~/dotfiles/git/setup_git.sh
