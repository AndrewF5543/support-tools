#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Gathering Threat Stack FIM information ******************************/"

echo "/* tsfim.config.json ***************************************************/"
if [ -f /opt/threatstack/etc/tsfim.config.json ]; then
    cat /opt/threatstack/etc/tsfim.config.json
fi
echo "/* fanotify tsfim in proc **********************************************/"
FIM_PID=`cat /opt/threatstack/cloudsight/pids/tsfim.pid`
# https://www.kernel.org/doc/Documentation/filesystems/proc.txt
grep fanotify /proc/$FIM_PID/fdinfo/*
echo "/* inotify proc information ********************************************/"
echo "max_queued_events"
cat /proc/sys/fs/inotify/max_queued_events
echo "max_user_instances"
cat /proc/sys/fs/inotify/max_user_instances
echo "max_user_watches"
cat /proc/sys/fs/inotify/max_user_watches
echo "/* Processes creating inotify watches **********************************/"
# https://bbs.archlinux.org/viewtopic.php?id=171704
ps -p $(find /proc/*/fd/* -type l -lname 'anon_inode:inotify' -print 2> /dev/null | sed -e 's/^\/proc\/\([0-9]*\)\/.*/\1/')
echo "/* Done gathering Threat Stack FIM information *************************/"
