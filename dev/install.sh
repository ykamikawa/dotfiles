#!/bin/bash
#
# Clone dotfiles and nvim settings
git clone git@github.com:ykamikawa/dotfiles.git ~/dotfiles
git clone git@github.com:ykamikawa/nvim-packer-lsp ~/nvim-packer-lsp

# pyenv
rm -rf ~/.pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# goenv
rm -rf ~/.goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# nodenv
rm -rf ~/.nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv

# zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
rm ~/.zshrc
ln -s ~/dotfiles/raspi/.zshrc ~/.zshrc

# neovim
# Get latest neovim nightly release version
function get_latest_nightly() {
    local LOCAL_BIN="$HOME/local/bin" #nvimを置く場所。各々で変更してください。
    local app_name="nvim"
    local app_path="$LOCAL_BIN/$app_name"

    mkdir -p $LOCAL_BIN
    rm -rf $LOCAL_BIN/$app_name

    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract

    mv squashfs-root/usr/bin/nvim $app_path
    rm -rf squashfs-root

    chmod u+x $app_path
}
get_latest_nightly
ln -s ~/nvim-packer-lsp ~/.config/nvim
