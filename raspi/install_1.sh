export DEBIAN_FRONTEND=noninteractive
sudo -E apt update
sudo -E apt upgrade
sudo -E apt install -y git zsh tmux vim openssl docker-ce docker-ce-cli container.io libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev
# docker
sudo -E apt-get update
sudo -E apt-get install docker-ce docker-ce-cli containerd.io
docker -v
# zsh
rm ~/.zshrc
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
