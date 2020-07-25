#! /bin/bash
echo "starting minecraft server."

# start deployment playbook
ansible-playbook deploy.yml

if [ -z $MC_PROP_RCON_PASSWORD ]
then
  echo "ERROR: MC_PROP_RCON_PASSWORD is not defined. Shutting down."
  exit 1
fi

# start server
cd /minecraft-data && java -Xmx${MC_MEMORY_MAX} -Xms${MC_MEMORY_MIN} -jar /minecraft-data/minecraft.jar