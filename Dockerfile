FROM ubuntu:16.10
MAINTAINER Michael Mior <michael.mior@gmail.com>

RUN locale-gen en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update && \
    apt-get install -qq -o=Dpkg::Use-Pty=0 \
      autoconf \
      build-essential \
      bison \
      editorconfig \
      flex \
      cabal-install \
      curl \
      default-jre \
      dirmngr \
      ed \
      git \
      gnupg2 \
      jq \
      latexmk \
      libbz2-dev \
      libc6-dev \
      libncurses-dev \
      libreadline-dev \
      libssl-dev \
      libsqlite3-dev \
      libtool \
      libyaml-dev \
      libxml2 \
      ncurses-dev \
      opam \
      openssl \
      php-cli \
      python \
      racket \
      sudo \
      tmux \
      vim-nox \
      wget \
      zlib1g-dev \
      zsh \
    > /dev/null && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -s /bin/zsh tester
ADD . /home/tester/.dotfiles
RUN chown -R tester:tester /home/tester && \
    echo 'tester ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tester && \
    chmod 0440 /etc/sudoers.d/tester
USER tester

ENV HOME /home/tester
ENV TMUX y
ENV TMUX_PLUGIN_MANAGER_PATH "/home/tester/.tmux/plugins/"
ENV GIT_AUTHOR_NAME Michael Mior
ENV GIT_AUTHOR_EMAIL michael.mior@gmail.com

WORKDIR /home/tester/.dotfiles
RUN git submodule update --init
RUN ./script/install
