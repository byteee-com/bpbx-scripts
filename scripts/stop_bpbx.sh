#!/bin/bash

# get pid
PID=$(ps -ef | grep bpbx.jar | grep -v grep | awk '{print $2}')

# 停止应用程序
if [ -n "$PID" ]; then
    kill -9 $PID
fi


/usr/sbin/asterisk -rx 'core stop now'