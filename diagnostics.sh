#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
if [ $EUID -gt 0 ] ; then
    echo "You must be root to run diagnostics.sh"
    exit
fi
echo "/* BEGINNING THREAT STACK DIAGNOSTICS **********************************/"
mkdir /tmp/threatstack_diagnostics
bash system/gather_system_info.sh | sudo tee /tmp/threatstack_diagnostics/system_info.txt
bash docker/gather_docker_info.sh | sudo tee /tmp/threatstack_diagnostics/docker_info.txt
bash agent/gather_agent_info.sh | sudo tee /tmp/threatstack_diagnostics/agent_info.txt
bash agent/gather_fim_info.sh | sudo tee /tmp/threatstack_diagnostics/fim_info.txt
echo "/* COPYING THREAT STACK LOG FILES *** **********************************/"
cp /opt/threatstack/cloudsight/logs/cloudsight.log /tmp/threatstack_diagnostics/cloudsight.log
cp /opt/threatstack/cloudsight/logs/install.log /tmp/threatstack_diagnostics/install.log
cp /opt/threatstack/cloudsight/logs/error.log /tmp/threatstack_diagnostics/error.log
cp /opt/threatstack/cloudsight/logs/threatstack-audit.log /tmp/threatstack_diagnostics/threatstack-audit.log
cp /opt/threatstack/cloudsight/logs/threatstack-tsfim.log /tmp/threatstack_diagnostics/threatstack-tsfim.log
bash tar/tar_logs.sh
rm -rf /tmp/threatstack_diagnostics
echo "/* ENDING THREAT STACK DIAGNOSTICS *************************************/"

