#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
#current_date="$(date +'%m-%d-%Y')"
#name=ts_logs_$(hostname)_${current_date}
#tar -czvf ${name}.tar.gz -C /tmp/ threatstack_diagnostics || ( echo "Failed to generate tarball! Exiting" ; exit 1 )
tar -czvf $1 -C /tmp/ threatstack_diagnostics || ( echo "Failed to generate tarball! Exiting" ; exit 1 )
