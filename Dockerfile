FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive

ARG PROVISION
ENV PROVISION ${PROVISION:-light}
ARG ZONEINFO
ENV ZONEINFO ${ZONEINFO:-Asia/Tokyo}
ARG LANG
ENV LANG ${LANG:-ja_JP.UTF-8}
ARG USER
ENV USER ${USER:-shultu}
ARG PASS
ENV PASS ${PASS:-shultu}
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

# sudo & ssh-config
RUN mkdir -p /home/$USER/bin \
 && useradd -s /bin/bash -d /home/$USER $USER \
 && echo "$USER:$PASS" | chpasswd \
 && echo ${USER}' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/$USER \
 && mkdir -p /home/$USER/.ssh \
 && mkdir -p /var/workspace/ \
 && echo "Include /var/workspace/.ssh/config" > /home/$USER/.ssh/config \
 && chown -R $USER:$USER /home/$USER \
 && echo "Since this directory is not a mounted directory, it is not persisted." > /var/workspace/readme

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

USER $USER
WORKDIR /provision

# provision
RUN ./${PROVISION}.sh

# vacuum
RUN sudo apt clean \
 && sudo apt autoclean \
 && sudo rm -f /provision.sh \
 && sudo rm -rf /tmp/*

WORKDIR /home/$USER
ENV HOME /home/$USER

CMD ["/bootstrap.sh"]
