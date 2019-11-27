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
    fcitx-mozc


. ../provision/shell/include/awscli.sh
# . ../provision/shell/include/gcloud.sh  // bash

. ../provision/shell/include/nginx.sh
. ../provision/shell/include/ngrok.sh
. ../provision/shell/include/certbot.sh

. ../provision/shell/include/cwebp.sh
. ../provision/shell/include/eslint.sh
. ../provision/shell/include/hadolint.sh
. ../provision/shell/include/js-beautify.sh
. ../provision/shell/include/Ricty.sh
. ../provision/shell/include/rsense.sh
. ../provision/shell/include/sql-formatter.sh
. ../provision/shell/include/rim.sh
. ../provision/shell/include/sshrc.sh
. ../provision/shell/include/xpanes.sh
. ../provision/shell/include/tbls.sh
. ../provision/shell/include/trans.sh
. ../provision/shell/include/jmeter.sh
. ../provision/shell/include/vegeta.sh

. ../provision/shell/include/chrome.sh
. ../provision/shell/include/postman.sh

