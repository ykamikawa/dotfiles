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

# neovim
alias vim='nvim'
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$HOME/.local/bin:$PATH
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# nodenv
export NODENV_ROOT=$HOME/.nodenv
export PATH=$NODENV_ROOT/bin:$PATH
eval "$(nodenv init -)"

# go
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
alias gobuild="go build -o"
export PATH=$GOPATH/bin:$PATH
export LGOPATH=$GOPATH/src/github.com/yunabe/lgo

# rust
export PATH=$HOME/.cargo/bin:$PATH

# browser
export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

# usr binary
export PATH=$HOME/.local/bin:$PATH

eval "$(starship init zsh)"

# # rancher
# export PATH=$HOME/.rd/bin:$PATH
# 
# ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
# export PATH="/Users/yuta.kamikawa.002/.rd/bin:$PATH"
# ### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# 
# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/yuta.kamikawa.002/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuta.kamikawa.002/google-cloud-sdk/path.zsh.inc'; fi
# 
# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/yuta.kamikawa.002/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuta.kamikawa.002/google-cloud-sdk/completion.zsh.inc'; fi
# 
# alias gc="gcloud compute"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/
