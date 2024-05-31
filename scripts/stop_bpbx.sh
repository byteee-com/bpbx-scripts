#!/bin/bash

# 获取进程ID
PID=$(pgrep -f bpbx.jar)

# 检查是否找到进程ID
if [ -z "$PID" ]; then
    echo "No bpbx.jar process found."
    exit 1
fi

echo "Found bpbx.jar process with PID: $PID"

# 尝试停止应用程序
kill $PID
sleep 3  # 等待5秒钟

# 检查进程是否已经停止
if ps -p $PID > /dev/null; then
    echo "Process did not terminate, forcefully killing it."
    kill -9 $PID
    sleep 1  # 再等待1秒钟
else
    echo "Process terminated successfully."
fi

# 再次检查进程是否已经停止
if ps -p $PID > /dev/null; then
    echo "Failed to kill process with PID: $PID"
    exit 1
else
    echo "Process with PID: $PID killed successfully."
fi


/usr/sbin/asterisk -rx 'core stop now'