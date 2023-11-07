#!/bin/bash

USR='devops'

for host in `cat remote_hosts`
do
   echo
   echo "#########################################################"
   echo "Connecting to $host"
   echo "Pushing Script to $host"
   scp websetup.sh $USR@$host:/tmp/
   echo "Executing Script on $host"
   ssh $USR@$host sudo /tmp/websetup.sh
   ssh $USR@$host sudo rm -rf /tmp/websetup.sh
   echo "#########################################################"
   echo
done 

# websetup.sh file is copied to the /tmp/ folder of the host machine
# Then, it is executed on the host using ssh
# At last, it is removed from the host machine for security and cleanliness
