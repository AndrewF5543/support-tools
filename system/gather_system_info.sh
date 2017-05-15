#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Gathering system information ****************************************/"

echo "/* Getting kernel version **********************************************/"
uname -a
echo "/* Getting OS version **************************************************/"
cat /etc/issue
echo "/* Getting system uptime ***********************************************/"
uptime
echo "/* Getting status of auditd ********************************************/"
service auditd status
echo "/* Getting TS agent version ********************************************/"
sudo cloudsight version
echo "/* Getting CloudSight status *******************************************/"
sudo cloudsight status
echo "/* cat /opt/threatstack/cloudsight/config/config.json ******************/"
sudo cat /opt/threatstack/cloudsight/config/config.json
echo -e "\n"
echo "/* Done gathering system information ***********************************/"
