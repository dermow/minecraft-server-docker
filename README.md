# minecraft-server-docker

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
