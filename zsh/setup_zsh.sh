brew install z
brew install zsh
sudo chsh -s `which zsh` tyler
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
brew install npm
npm install --global lambda-pure-prompt
ln -s ~/dotfiles/zsh/oh-my-zsh/custom/themes ~/.oh-my-zsh/custom/themes
ln -s ~/dotfiles/zsh/oh-my-zsh/functions ~/.oh-my-zsh/functions

