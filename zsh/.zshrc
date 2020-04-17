# oh-my-zsh
export ZSH=~/.oh-my-zsh
plugins=(git zsh-syntax-highlighting zsh-completions zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# File navigation aliases
alias ..='cd ..'
alias _='cd -'
# add colors for filetype recognition
alias ls='ls -hF -G'
alias ll='ls -l -h'
alias la='ls -lA'
alias du='du -kh'
alias df='df -kTh'

# k8s
alias k='kubectl'
alias mn1='kubectl config use-context mn1'
alias mnj='kubectl config use-context mnj'

# neovim
alias vim='nvim'
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$HOME/.local/bin
eval "$(pyenv init -)"

# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/work/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
alias gobuild="go build -o"

# browser
export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

eval "$(starship init zsh)"
