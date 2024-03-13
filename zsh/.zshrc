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

# nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ykamikawa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ykamikawa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ykamikawa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ykamikawa/google-cloud-sdk/completion.zsh.inc'; fi
