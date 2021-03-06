# oh-my-zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="candy"
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

# neovim
alias vim='nvim'
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$HOME/.local/bin
eval "$(pyenv init -)"

# go
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
alias gobuild="go build -o"
export PATH=$GOPATH/bin:$PATH
export LGOPATH=$GOPATH/src/github.com/yunabe/lgo
