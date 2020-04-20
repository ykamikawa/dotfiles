export DEBIAN_FRONTEND=noninteractive
sudo -E apt update
sudo -E apt upgrade
sudo -E apt install -y git zsh tmux vim openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev

# neovim
sudo -E apt install -y software-properties-common
sudo -E add-apt-repository ppa:neovim-ppa/unstable
sudo -E apt update
sudo -E apt install -y neovim

# pyenv
rm -rf ~/.pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

rm -rf ~/.goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# oh-my-zssh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"h
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
