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
