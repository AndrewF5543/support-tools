#!/bin/bash

# Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com
echo "/* Gathering docker information ****************************************/"
if ! hash docker 2>/dev/null; then
    echo "Unable to find docker!"
    exit
fi

echo "/* docker version ******************************************************/"
docker version
echo "/* docker info *********************************************************/"
docker info
echo "/* ls -l /var/lib/docker/containers ************************************/"
ls -l /var/lib/docker/containers
echo "/* cat /var/lib/docker/containers/*/config* ****************************/"
cat /var/lib/docker/containers/*/config*
echo "/* docker ps ***********************************************************/"
docker ps

echo "/* Get a container ID **************************************************/"
CID=`docker ps | tail -n 1 | awk '{print $1}'`
echo $CID
if hash nc 2>/dev/null; then
    echo "/* Docker json *****************************************************/"
    echo -e "GET /v1.20/containers/${CID}/json HTTP/1.1\r\nHost:\r\n" | nc -U /var/run/docker.sock
    echo "/* Docker top ******************************************************/"
    echo -e "GET /v1.20/containers/${CID}/top HTTP/1.1\r\nHost:\r\n" | nc -U /var/run/docker.sock
fi
echo "/* Docker client inspect ***********************************************/"
docker container inspect $CID
echo "/* Docker client top ***************************************************/"
docker container top $CID

echo "/* Get a process ID ****************************************************/"
if hash nc 2>/dev/null; then
    PID=`echo -e "GET /v1.20/containers/${CID}/top HTTP/1.1\r\nHost:\r\n" | nc -U /var/run/docker.sock | tail -1 | sed 's/^.*\[\[\([^]]*\)\]\].*/\1/' | awk -F',' '{ print $2 }' | tr -d '"'`
else
    PID=`docker container top ${CID} | tail -1 | awk '{print $2}'`
fi
echo $PID
echo "/* readlink ************************************************************/"
readlink /proc/${PID}/ns/pid

echo "/* Done gathering docker information ***********************************/"
