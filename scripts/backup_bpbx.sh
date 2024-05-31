#!/bin/bash

backup_file_path="$1"

# 设置备份目录
BACKUP_DIR="/tmp/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# 备份 MySQL 数据库
mysqldump -u root --password=  bpbx > "$BACKUP_DIR/bpbx.sql"

# 备份 Redis 数据库
redis-cli save
cp /var/lib/redis/dump.rdb "$BACKUP_DIR/redis.rdb"

# 备份配置文件
cp -r /etc/asterisk "$BACKUP_DIR/asterisk"
cp /etc/odbc.ini "$BACKUP_DIR/odbc.ini"

# 打包成 ZIP
ZIP_FILE="$backup_file_path"
zip -r "$ZIP_FILE" "$BACKUP_DIR"

# 删除临时备份目录
rm -rf "$BACKUP_DIR"