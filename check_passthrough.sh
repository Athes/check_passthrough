#!/bin/bash

for i in $2;do echo $i: |tr -d "\n"; sshpass -p $1 ssh admin@$i show chassis|grep Fault;done
