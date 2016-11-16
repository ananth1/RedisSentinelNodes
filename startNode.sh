#!/bin/bash

if [ $# -ne 1 ]; then
    echo $0: usage: startNode nodeName
    exit 1
fi

nodeName=$1

nohup redis-server /etc/redis/$nodeName/redis.conf > $1-node.log 2>&1 &
nohup redis-sentinel /etc/redis/$nodeName/sentinel.conf > $1-sentinel.log 2>&1 &