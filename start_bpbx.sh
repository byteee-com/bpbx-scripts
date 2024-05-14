#!/bin/bash

# start
/usr/sbin/asterisk -mqf -C /etc/asterisk/asterisk.conf
nohup java -jar /opt/bpbx/bpbx.jar >> /var/log/bpbx 2>&1 &
