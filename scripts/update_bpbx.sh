#!/bin/bash

# 检查是否提供了 ZIP 文件路径参数
if [ -z "$1" ]; then
  echo "请提供 ZIP 文件的路径"
  exit 1
fi

ZIP_FILE_PATH=$1

# 创建临时目录用于解压缩
TEMP_DIR=$(mktemp -d)

# 解压缩 ZIP 文件到临时目录
unzip "$ZIP_FILE_PATH" -d "$TEMP_DIR"

# 更新配置文件
cp -rf "$TEMP_DIR/config/asterisk/" /etc/asterisk
chmod -R 755 /etc/asterisk
chown -R asterisk:asterisk /etc/asterisk

cp -rf $TEMP_DIR/bpbx.jar /opt/bpbx/
cp -rf $TEMP_DIR/web/* /opt/bpbx/web/

# 删除临时目录
rm -rf "$TEMP_DIR"

# 重启服务
systemctl restart bpbx

echo "升级完成"