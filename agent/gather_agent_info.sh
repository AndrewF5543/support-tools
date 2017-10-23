#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Gathering Threat Stack agent information ****************************/"

echo "/* cloudsight version **************************************************/"
/opt/threatstack/bin/cloudsight version
echo "/* cloudsight status ***************************************************/"
/opt/threatstack/bin/cloudsight status
if hash dpkg-query 2>/dev/null; then
    echo "/* dpkg-query -l | grep threatstack ********************************/"
    dpkg-query -l | grep threatstack
fi
echo "/* cat /opt/threatstack/cloudsight/config/config.json ******************/"
cat /opt/threatstack/cloudsight/config/config.json
echo -e "\n"
if hash host 2>/dev/null; then
    echo "/* host app.threatstack.com ****************************************/"
    host app.threatstack.com
fi
echo "/* ll opt **************************************************************/"
ls -l /opt
echo "/* ll opt threatstack **************************************************/"
ls -l /opt/threatstack
echo "/* ll opt threatstack cloudsight pids **********************************/"
ls -l /opt/threatstack/cloudsight/pids
echo "/* Done gathering Threat Stack agent information ***********************/"
