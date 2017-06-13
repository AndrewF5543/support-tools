#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Tarring log files ***************************************************/"
current_date="$(date +'%m-%d-%Y')"
name=ts_logs_$(hostname)_${current_date}
ln -s /opt/threatstack/cloudsight/logs ${name}
tar --exclude tsaudit* -cvzf ${name}.tar.gz ${name}/* || true
rm ${name}
echo "/* Done tarring log files **********************************************/"
