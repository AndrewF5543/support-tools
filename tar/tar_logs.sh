#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Tarring log files ***************************************************/"
current_date="$(date +'%m-%d-%Y')"
name=ts_logs_$(hostname)_${current_date}
tar -czvf ${name}.tar.gz -C /tmp/ threatstack_diagnostics/*
echo "/* Done tarring log files **********************************************/"
