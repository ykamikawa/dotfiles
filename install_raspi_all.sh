export DEBIAN_FRONTEND=noninteractive
sudo -E apt update
sudo -E apt upgrade
sudo -E install -y git zsh tmux vim openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev

# oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# neovim
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

# init
rm ~/.zshrc
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
source ~/.zshrc

# python
pyenv install 3.7.0
pyenv global 3.7.0
pip install neovim

# go
goenv install 1.9.7
goenv global 1.9.7

# starship
curl -fsSL https://starship.rs/install.sh | bash
ln -s ~/dotfiles/zsh/starship.toml ~/.config/starship.toml
