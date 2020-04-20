# neovim
export DEBIAN_FRONTEND=noninteractive
sudo -E apt install software-properties-common
sudo -E add-apt-repository ppa:neovim-ppa/unstable
sudo -E apt update
sudo -E apt install neovim
mkdir -p .config/nvim
ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/neovim/dein.toml ~/.config/nvim/dein.toml

# pyenv
rm -rf ~/.pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# goenv
rm -rf ~/.goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# init
rm ~/.zshrc
ln -s ~/dotfiles/raspi/.zshrc ~/.zshrc
source ~/.zshrc

# python
pyenv install 3.7.0
pyenv global 3.7.0
pip install neovim

# go
goenv install 1.9.7
goenv global 1.9.7
