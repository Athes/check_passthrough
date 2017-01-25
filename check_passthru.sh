#!/bin/bash
# Usage: check_passthru.sh <admin_password> "<list of module IPs, separated with spaces, between quotes>"
Fault=`for i in $2;do echo $i: |tr -d "\n"; sshpass -p $1 ssh admin@$i show chassis|grep Fault;done|grep On`
if  [[ $? -eq "0" ]];then
echo "Module error: " $Fault
retcode=2
else
echo "No fault"
retcode=0
fi
exit $retcode
