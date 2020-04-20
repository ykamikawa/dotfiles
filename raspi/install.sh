# zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
rm ~/.zshrc
ln -s ~/dotfiles/raspi/.zshrc ~/.zshrc

# neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/neovim/dein.toml ~/.config/nvim/dein.toml

# python
PYENV_ROOT=$HOME/.pyenv
PATH=$PATH:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$HOME/.local/bin
pyenv install 3.7.0
pyenv global 3.7.0
pip install neovim

# go
GOENV_ROOT=$HOME/.goenv
PATH=$GOENV_ROOT/bin:$PATH
goenv install 1.9.7
goenv global 1.9.7

zsh
