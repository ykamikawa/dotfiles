# zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
# pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
# goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# init
rm ~/.zshrc
ln -s ~/~/dotfiles/zsh/..zshrc ~/.zshrc
source ~/.zshrc
