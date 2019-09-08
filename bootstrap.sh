#!/bin/bash

if [ ! -e /bootstrap.lock ]; then
    echo -e '\e[1;32m[bootstrap.sh]\e[m'

    # workspace
    sudo chown $(id -u):$(id -g) ${HOME}

    # dotfiles
    if [ -e /tmp/dotfiles ]; then
        find /tmp/dotfiles/ -type f | awk '! /^\.git$/' | xargs -I DOTFILE cp DOTFILE ~/
    fi

    # bash_profile added during build
    if [ -e /tmp/.include_profile ]; then
        cat /tmp/.include_profile >> ~/.bash_profile
    fi

    sudo touch /bootstrap.lock
fi

/bin/bash -l
# /usr/bin/supervisord -n
# startkde
