#!/bin/bash

# start
nohup java -jar /opt/bpbx/bpbx.jar >/var/log/bpbx 2>&1 &
