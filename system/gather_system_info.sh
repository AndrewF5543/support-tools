#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Gathering system information ****************************************/"

echo "/* Hostname ************************************************************/"
hostname
echo "/* Getting kernel version **********************************************/"
uname -a
echo "/* Kernel command line *************************************************/"
cat /proc/cmdline
echo "/* Getting OS version **************************************************/"
if [ -f /etc/redhat-release ]
then
    cat /etc/redhat-release
else
    cat /etc/issue
fi
echo "/* Getting system uptime ***********************************************/"
uptime
if hash service 2>/dev/null; then
    echo "/* Getting status of auditd ****************************************/"
    service auditd status
fi
if [ -e /usr/bin/lsb_release ]
then
    echo "/* lsb_release *****************************************************/"
    /usr/bin/lsb_release -a
fi
if [ -e /etc/os-release ]
then
    echo "/* os-release *****************************************************/"
    cat /etc/os-release
fi
echo "/* /proc/stat **********************************************************/"
cat /proc/stat
echo "/* /proc/net/dev *******************************************************/"
cat /proc/net/dev
echo "/* /proc/meminfo *******************************************************/"
cat /proc/meminfo
echo "/* Done gathering system information ***********************************/"
