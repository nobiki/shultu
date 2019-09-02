#!/bin/bash

. ./light.sh

sudo apt install -y \
    tree \
    ftp \
    ncftp \
    dnsutils \
    procps \
    siege \
    inotify-tools \
    inetutils-traceroute \
    poppler-utils \
    recode \
    iftop \
    bmon \
    yui-compressor \
    mutt \
    msmtp \
    cmigemo \
    pandoc \
    bison \
    texinfo \
    texlive \
    texlive-lang-cjk \
    texlive-luatex \
    texlive-xetex \
    wkhtmltopdf \
    fonts-noto-cjk \
    meld \
    mirage \
    ranger \
    pwgen \
    lsb-release \
    sl \
    toilet \
    lolcat \
    ibus-mozc


. ./include/awscli.sh
# . ./include/gcloud.sh  // bash

. ./include/nginx.sh
. ./include/ngrok.sh
. ./include/certbot.sh

. ./include/cwebp.sh
. ./include/eslint.sh
. ./include/hadolint.sh
. ./include/js-beautify.sh
. ./include/Ricty.sh
. ./include/rsense.sh
. ./include/sql-formatter.sh
. ./include/rim.sh
. ./include/sshrc.sh
. ./include/xpanes.sh
. ./include/tbls.sh
. ./include/trans.sh
. ./include/jmeter.sh
. ./include/vegeta.sh

. ./include/chrome.sh
. ./include/postman.sh

