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
  
RUN addgroup minecraft \
  && adduser -G minecraft -h /minecraft -D minecraft \
  && mkdir -p /minecraft-data  \
  && chown minecraft:minecraft /minecraft-data /minecraft
  
WORKDIR /minecraft
ADD ./start.sh start.sh
ADD ./templates templates
ADD server.properties.default server.properties
ADD deploy.yml deploy.yml
RUN chmod 770 start.sh

EXPOSE 25565

ENTRYPOINT ["/minecraft/start.sh"]