#! /bin/bash
echo "starting minecraft server."

# start deployment playbook
ansible-playbook deploy.yml

# start server
cd /minecraft-data && java -Xmx${MC_MEMORY_MAX} -Xms${MC_MEMORY_MIN} -jar /minecraft-data/minecraft.jar
