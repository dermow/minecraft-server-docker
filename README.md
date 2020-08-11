# minecraft-server-docker
Simple Docker image to run a Minecraft Server. Currently supported forks are: 
- bukkit
- spigot

# Prerequisites
- A password for rcon needs to be provided by environment 'MC_PROP_RCON_PASSWORD'

## Environments
| ENV | Default | Description |
|--|--|--|
| MC_TYPE | craftbukkit | Which server binary to download and use. Currently supported: 'craftbukkit', 'spigot' |
| MC_VERSION | 1.16.1 | Minecraft Server Relase to download and use |
| MC_MEMORY_MIN | 128M | Initial allocated memory. This represents the java Xms parameter |
| MC_MEMORY_MAX | 512M | Maximum allocated memory. This represents the java Xmx parameter |
| MC_PROP_MOTD | Minecraft Server on Docker| Minecraft Message of the Day |
| MC_PROP_VIEW_DISTANCE | 12 | Server side maximum view distance |
| MC_PROP_RCON_PASSWORD | none, REQUIRED | Password to connect to rcon |
| MC_PROP_GAMEMODE | survival | Default gamemode |
| MC_PROP_DIFFICULTY | easy | Default difficulty |
| MC_PROP_WHITELIST | false | Set to true to turn whitelist per default on |
| MC_PROP_ENFORCE_WHITELIST | false | Set to true to enforce whitelist changes without server restart |



More config opitons, especially for entries in server.propertis will follow

## Run docker container
```bash
docker run -d -p 25565:25565 --name minecraft-server dermow/minecraft-server:latest
```

## docker compose
### Simple
``` yaml
version: '3.0'
services: 
  mcsrv:
    image: dermow/minecraft-server:latest
    ports:
      - 25656:25656
    environment:
      MC_PROP_RCON_PASSWORD: rcon1337
      EULA: "true"
```

### Use persistent volumes
``` yaml
version: '3.0'
volumes:
  mcdata:
services: 
  mcsrv:
    image: dermow/minecraft-server:latest
    ports:
      - 25656:25656
    environment:
      MC_PROP_RCON_PASSWORD: rcon1337
      EULA: "true"
    volumes:
      - mcdata:/minecraft-data
```

### Use spigot instead of craftbukkit
``` yaml
version: '3.0'
volumes:
  mcdata:
services: 
  mcsrv:
    image: dermow/minecraft-server:latest
    ports:
      - 25656:25656
    environment:
      MC_PROP_RCON_PASSWORD: rcon1337
      MC_TYPE: spigot
      EULA: "true"
    volumes:
      - mcdata:/minecraft-data
```
