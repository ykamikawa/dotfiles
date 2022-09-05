# pyenv
rm -rf ~/.pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# goenv
rm -rf ~/.goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# rust
curl https://sh.rustup.rs -sSf | sh
cargo install starship --locked
