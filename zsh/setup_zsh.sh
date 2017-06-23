brew install tmux
brew install z
brew install zsh
sudo chsh -s `which zsh` tyler
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

