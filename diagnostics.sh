#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* BEGINNING THREAT STACK DIAGNOSTICS **********************************/"
sudo bash system/gather_system_info.sh | sudo tee /opt/threatstack/cloudsight/logs/system_info.txt
sudo bash docker/gather_docker_info.sh | sudo tee /opt/threatstack/cloudsight/logs/docker_info.txt
sudo bash tar/tar_logs.sh
echo "/* ENDING THREAT STACK DIAGNOSTICS *************************************/"

