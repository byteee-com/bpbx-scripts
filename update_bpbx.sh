#!/bin/bash



# 更新配置文件

wget https://github.com/byteee-com/bpbx-scripts/archive/refs/heads/main.zip

unzip main.zip  -d .

cd bpbx-scripts-main 



cp -rf config/asterisk/ /etc/asterisk


chmod -R 755 /etc/asterisk

chown -R asterisk:asterisk /etc/asterisk



cp bpbx.jar /opt/


cp -rf web/ /opt/bpbx/web/