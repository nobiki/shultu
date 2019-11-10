#!/bin/bash

sudo apt install -y \
    vim-nox \
    tig \
    sed \
    gawk \
    curl \
    wget \
    rsync \
    aria2 \
    screen \
    expect \
    cron \
    htop \
    ncdu \
    iputils-ping \
    iproute2 \
    openssl \
    make \
    build-essential \
    autoconf \
    automake \
    gcc \
    g++ \
    bzip2 \
    zip \
    unzip \
    pigz \
    p7zip-full

. ../provision/shell/include/yarn.sh
. ../provision/shell/include/fzf.sh
. ../provision/shell/include/ctags.sh
. ../provision/shell/include/enhancd.sh
. ../provision/shell/include/anyenv.sh
. ../provision/shell/include/direnv.sh
. ../provision/shell/include/git_find_big.sh
. ../provision/shell/include/ctop.sh
. ../provision/shell/include/hcat.sh
. ../provision/shell/include/highway.sh
. ../provision/shell/include/jq.sh
