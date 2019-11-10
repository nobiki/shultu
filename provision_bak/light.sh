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

. ./include/yarn.sh
. ./include/fzf.sh
. ./include/ctags.sh
. ./include/enhancd.sh
. ./include/anyenv.sh
. ./include/direnv.sh
. ./include/git_find_big.sh
. ./include/ctop.sh
. ./include/hcat.sh
. ./include/highway.sh
. ./include/jq.sh
