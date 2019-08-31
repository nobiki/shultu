#!/bin/bash

sudo apt install -y \
    vim-nox \
    tig \
    sed \
    gawk \
    curl \
    wget \
    aria2 \
    screen \
    expect \
    cron \
    htop \
    ncdu \
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
. ./include/enhancd.sh
. ./include/anyenv.sh
. ./include/direnv.sh
. ./include/git_find_big.sh
. ./include/hcat.sh
. ./include/highway.sh
. ./include/jq.sh
