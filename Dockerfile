FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive

ARG PROVISION
ENV PROVISION ${PROVISION:-light}
ARG ZONEINFO
ENV ZONEINFO ${ZONEINFO:-Asia/Tokyo}
ARG LANG
ENV LANG ${LANG:-ja_JP.UTF-8}
ARG LOGIN_ID
ENV LOGIN_ID ${LOGIN_ID:-shultu}
ARG LOGIN_PW
ENV LOGIN_PW ${LOGIN_PW:-shultu}
ARG LOCALE_DEF
ENV LOCALE_DEF ${LOCALE_DEF:-ja_JP}

# entrypoint
COPY bootstrap.sh /bootstrap.sh

# deal with slim variants not having man page directories (which causes "update-alternatives" to fail)
RUN if [ ! -d /usr/share/man/man1 ]; then \
        mkdir -p /usr/share/man/man1; \
    fi;

# add provision script
ADD provision/ /provision/
WORKDIR /provision

# provision (core)
RUN /provision/core.sh

# langage & timezone
RUN locale-gen ${LANG} \
 && localedef -f UTF-8 -i ${LOCALE_DEF} ${LANG} \
 && update-locale LANG=${LANG} \
 && ln -sf /usr/share/zoneinfo/${ZONEINFO} /etc/localtime

# kde plasma desktop
# RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
#  && echo keyboard-configuration keyboard-configuration/layout select 'Japanese (JP)' | debconf-set-selections \
#  && echo keyboard-configuration keyboard-configuration/layoutcode select 'ja' | debconf-set-selections \
#  && echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections \
#  && apt install -y kde-plasma-desktop

# sudo
RUN mkdir -p /home/$LOGIN_ID \
 && useradd -s /bin/bash -d /home/$LOGIN_ID $LOGIN_ID \
 && echo "$LOGIN_ID:$LOGIN_PW" | chpasswd \
 && echo ${LOGIN_ID}' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/$LOGIN_ID \
 && chown -R $LOGIN_ID:$LOGIN_ID /home/$LOGIN_ID

ENV HOME /home/$LOGIN_ID
USER $LOGIN_ID

# provision
RUN ./${PROVISION}.sh

# vacuum
RUN sudo apt clean \
 && sudo apt autoclean \
 && sudo rm -rf /tmp/*

WORKDIR ${HOME}
CMD ["/bootstrap.sh"]
