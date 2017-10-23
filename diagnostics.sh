#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
if [ $EUID -gt 0 ] ; then
    echo "You must be root to run diagnostics.sh"
    exit
fi
echo "/* BEGINNING THREAT STACK DIAGNOSTICS **********************************/"
bash system/gather_system_info.sh | sudo tee /opt/threatstack/cloudsight/logs/system_info.txt
bash docker/gather_docker_info.sh | sudo tee /opt/threatstack/cloudsight/logs/docker_info.txt
bash agent/gather_agent_info.sh | sudo tee /opt/threatstack/cloudsight/logs/agent_info.txt
bash agent/gather_fim_info.sh | sudo tee /opt/threatstack/cloudsight/logs/fim_info.txt
bash tar/tar_logs.sh
echo "/* ENDING THREAT STACK DIAGNOSTICS *************************************/"

