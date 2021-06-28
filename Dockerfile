FROM openjdk:16-jdk-alpine

# Define default values:
ENV MC_TYPE="craftbukkit"
ENV MC_VERSION="1.16.1"
ENV MC_MEMORY_MIN="128M"
ENV MC_MEMORY_MAX="512M"
ENV MC_PROP_MOTD="Minecraft Server on Docker"
ENV MC_PROP_VIEW_DISTANCE=12
ENV MC_PROP_GAMEMODE="survival"
ENV MC_PROP_DIFFICULTY="easy"
ENV MC_PROP_QUERY_PORT="25565"
ENV MC_PROP_ENFORCE_WHITELIST="true"
ENV MC_PROP_WHITELIST="false"

RUN apk add --no-cache -U \
  openssl \
  bash \
  curl iputils wget \
  git \
  sudo \
  python3 \
  ansible
  
RUN mkdir -p /minecraft-data /minecraft-data/plugins
  
WORKDIR /minecraft
ADD ./start.sh start.sh
ADD deploy.yml deploy.yml
ADD ./templates templates
RUN chmod 770 start.sh

# download rcon
ADD https://github.com/itzg/rcon-cli/releases/download/1.4.8/rcon-cli_1.4.8_linux_386.tar.gz rcon.tar.gz
RUN tar xzf rcon.tar.gz \
    && chmod u+x rcon-cli \
    && mv rcon-cli /usr/bin/rcon-cli


EXPOSE 25565

ENTRYPOINT ["/minecraft/start.sh"]
