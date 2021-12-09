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

# pfutil completion
source ~/.zsh/pf-completion.zsh

# pfkube
alias k="pf kubectl"
alias pfkube="pf pfkube"
alias pftaskqueue="pf pftaskqueue"
alias git-ghost="pf git-ghost"
alias pfbuild="pf pfbuild"
alias hdfs="pf hdfs"
alias docker="pf docker"
alias gcloud="pf gcloud"
alias mn1g2='pf kubectl config use-context mn1g2'
alias mnjg2='pf kubectl config use-context mnjg2'

# pfkube
export PFKUBE_DOCKER_ALLOWED_RUNTIME_UID=2379
# export PFKUBE_MNJ_DEFAULT_DOCKER_REGISTRY=harbor.mnj.pfn.io/user-ykamikawa  # This is used when --target-cluster=mnj
export PFKUBE_MNJ_DEFAULT_DOCKER_REGISTRY=asia-northeast1-docker.pkg.dev/pfn-artifactregistry/tmp  # This is used when --target-cluster=mnj
export PFKUBE_MNJ_DEFAULT_DOCKER_CRED_NAME=pfkube-harbor-cred  # This is used when --target-cluster=mnj
export PFKUBE_MNJ_DEFAULT_GIT_SECRET_NAME=pfkube-git-secret  # This is used when --target-cluster=mnj

# export PFKUBE_MN1G2_DEFAULT_DOCKER_REGISTRY=harbor.mnj.pfn.io/user-ykamikawa  # This is used when --target-cluster=mn1g2
export PFKUBE_MN1G2_DEFAULT_DOCKER_REGISTRY=asia-northeast1-docker.pkg.dev/pfn-artifactregistry/tmp  # This is used when --target-cluster=mnj
export PFKUBE_MN1G2_DEFAULT_DOCKER_CRED_NAME=pfkube-harbor-cred  # This is used when --target-cluster=mn1g2
export PFKUBE_MN1G2_DEFAULT_GIT_SECRET_NAME=pfkube-git-secret  # This is used when --target-cluster=mn1g2

eval "$(starship init zsh)"
