#!/bin/bash
# Usage: check_passthrough.sh <admin_password> <list of module IPs, separated with spaces>
for i in $2;do echo $i: |tr -d "\n"; sshpass -p $1 ssh admin@$i show chassis|grep Fault;done|grep On
rc=$?
if [[ rc != 0 ]];then
echo "Module error: " $i
retcode=1
else
echo "No fault"
retcode=0
fi
exit $retcode

