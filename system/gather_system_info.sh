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
if hash /usr/bin/lsb_release 2>/dev/null; then
    echo "/* lsb_release *****************************************************/"
    /usr/bin/lsb_release -a
fi
echo "/* /proc/stat **********************************************************/"
cat /proc/stat
echo "/* /proc/net/dev *******************************************************/"
cat /proc/net/dev
echo "/* /proc/meminfo *******************************************************/"
cat /proc/meminfo
echo "/* Done gathering system information ***********************************/"
