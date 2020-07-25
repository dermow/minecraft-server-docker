FROM openjdk:8u212-jre-alpine

ENV MC_TYPE="craftbukkit"
ENV MC_VERSION="1.16.1"
ENV MC_MEMORY_MIN="128M"
ENV MC_MEMORY_MAX="512M"


RUN apk add --no-cache -U \
  openssl \
  bash \
  curl iputils wget \
  git \
  sudo \
  python \
  ansible
  
RUN mkdir -p /minecraft-data /minecraft-data/plugins
  
WORKDIR /minecraft
ADD ./start.sh start.sh
ADD deploy.yml deploy.yml
ADD ./templates templates
RUN chmod 770 start.sh

# download rcon
ADD https://github.com/itzg/rcon-cli/releases/download/1.4.8/rcon-cli_1.4.8_linux_386.tar.gz rcon.tar.gz
RUN tar xzf rcon.tar.gz
RUN chmod u+x rcon-cli && mv rcon-cli /usr/bin/rcon-cli


EXPOSE 25565

ENTRYPOINT ["/minecraft/start.sh"]