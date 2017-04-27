#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Tarring log files ***************************************************/"
current_date="$(date +'%m-%d-%Y')"
tar -cvzf ts_logs$current_date.tar.gz /opt/threatstack/cloudsight/logs/ || true
echo "/* Done tarring log files **********************************************/"
