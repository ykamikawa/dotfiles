# Ubuntuをベースイメージとする
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && apt-get install -y tzdata

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    curl \
    git \
    zsh \
    locales \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    sudo  # sudoをインストールして、後でユーザーにsudo権限を与える

# neovimのインストール
RUN apt-get install -y neovim

# ロケールの設定
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# 開発用ユーザーを作成
RUN useradd -m -s /bin/zsh developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer

# 開発用ユーザーに切り替え
USER developer
WORKDIR /home/developer

# 各言語のインストール
# pyenv
RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv
ENV PATH /home/developer/.pyenv/bin:/home/developer/.pyenv/shims:$PATH
RUN eval "$(pyenv init --path)" && \
    pyenv install 3.10.0 && \
    pyenv global 3.10.0
# poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# go
RUN git clone https://github.com/syndbg/goenv.git ~/.goenv && \
    echo 'export PATH="$HOME/.goenv/bin:$PATH"' >> ~/.zshrc && \
    echo 'eval "$(goenv init -)"' >> ~/.zshrc && \
    export PATH="$HOME/.goenv/bin:$PATH" && \
    eval "$(goenv init -)" && \
    goenv install 1.16.3 && \
    goenv global 1.16.3

# nodenv, node-buildプラグインのインストール
RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv && \
    cd ~/.nodenv && src/configure && make -C src && \
    mkdir -p ~/.nodenv/plugins && \
    git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

# nodenvのパスを設定
ENV PATH="/home/developer/.nodenv/bin:/home/developer/.nodenv/shims:${PATH}"

# nodenv initを実行し、Node.jsをインストールするための新しいRUN命令
RUN eval "$(nodenv init -)" && \
    nodenv install 14.17.0 && \
    nodenv global 14.17.0

# oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# GitHubから設定ファイル用リポジトリをクローン
RUN git clone https://github.com/ykamikawa/dotfiles.git ~/dotfiles && \
    git clone https://github.com/ykamikawa/nvim-packer-lsp.git ~/.config/nvim

# Packer.nvim for neovim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    update~/.local/share/nvim/site/pack/packer/start/packer.nvim

# 設定ファイルを反映
# .zshrc
RUN rm ~/.zshrc && ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
# starship.toml
RUN ln -s ~/dotfiles/zsh/starship.toml ~/.config/starship.toml

# zshをデフォルトシェルとする
CMD ["/bin/zsh"]
