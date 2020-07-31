# minecraft-server-docker

## docker compose
``` yaml
version: '3.0'
volumes:
  mcdata:
services: 
  mcsrv:
    image: dermow/minecraft-server:latest
    ports:
      - 26675:25565
      - 9123:8123
    environment:
      MC_PROP_RCON_PASSWORD: rcon1337
      EULA: "true"
```
