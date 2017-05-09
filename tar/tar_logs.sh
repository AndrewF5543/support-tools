#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Tarring log files ***************************************************/"
current_date="$(date +'%m-%d-%Y')"
tar --exclude tsaudit* -cvzf ts_logs_$current_date.tar.gz /opt/threatstack/cloudsight/logs/ || true
echo "/* Done tarring log files **********************************************/"
