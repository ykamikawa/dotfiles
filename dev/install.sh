#!/bin/bash

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip
rm -rf ./aws

# docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

sudo apt update
sudo apt install -y \
  build-essential libssl-dev  libsqlite3-dev libbz2-dev libgdbm-dev libncurses5-dev \
  libncursesw5-dev libreadline-dev zlib1g-dev libffi-dev liblzma-dev \
  libjpeg-dev libpng-dev libtiff-dev \
  lua5.1 luarocks

# ImageMagick
wget https://www.imagemagick.org/download/ImageMagick.tar.gz
tar xvzf ImageMagick.tar.gz
cd ImageMagick-7.1.1-33
./configure
make
sudo make install
sudo ldconfig /usr/local/lib
cd ..
rm -rf ImageMagick-7.1.1-33
rm ImageMagick.tar.gz

# Neovim
sudo curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz -o nvim.tar.gz
sudo tar xzvf nvim.tar.gz -C /opt
sudo rm /usr/local/bin/nvim
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm -rf nvim.tar.gz
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# pyenv
rm -rf ~/.pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
PYENV_ROOT=~/.pyenv
PATH=$PATH:$PYENV_ROOT/shims:$PYENV_ROOT/bin:~/.local/bin
eval "$(pyenv init -)"
luarocks --local --lua-version=5.1 install magick
pyenv install 3.11.3
pyenv global 3.11.3
# pip install pynvim jupyter_client jupytext jupyterlab
# poetry
curl -sSL https://install.python-poetry.org | python3 - --version 1.5.1

# mecab, ripgrep
sudo apt-get update
sudo apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 ripgrep

# goenv
rm -rf ~/.goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv
GOENV_ROOT=~/.goenv
PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
goenv install 1.18.5
goenv global 1.18.5

# nodenv, node-buildプラグインのインストール
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src && \
mkdir -p ~/.nodenv/plugins && \
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
PATH=~/.nodenv/bin:~/.nodenv/shims:${PATH}
eval "$(nodenv init -)"
nodenv install 20.10.0
nodenv global 20.10.0

# Clone dotfiles and nvim settings
git clone git@github.com:ykamikawa/dotfiles.git ~/dotfiles
git clone git@github.com:ykamikawa/nvim-packer-lsp ~/nvim-packer-lsp

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
rm -rf ~/.zshrc
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

# starship
curl -sS https://starship.rs/install.sh | sh
rm -rf ~/.config/starship.toml
ln -s ~/dotfiles/zsh/starship.toml ~/.config/starship.toml

# wezterm
mkdir -p ~/.config/wezterm
ln -s ~/dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
