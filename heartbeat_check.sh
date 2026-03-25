#!/bin/bash
set -e

# Martech Heartbeat - 每2小时检查一次
# 检查 GitHub 仓库状态 + 竞品分析

LOG_FILE="$HOME/.openclaw/workspace/mertech-site/heartbeat.log"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] heartbeat_check.sh 开始运行" >> "$LOG_FILE"

cd ~/.openclaw/workspace/mertech-site || exit 1

# GitHub 状态检查
echo "=== Checking GitHub status ==="
git fetch origin main
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "New commits detected on remote!"
    # 可以在这里发送通知
fi

# 竞品分析 - 记录到日志
echo "=== Competitor Analysis ==="
DATE=$(date "+%Y-%m-%d %H:%M")
echo "[$DATE] Heartbeat check completed" >> heartbeat.log

echo "Heartbeat completed at $(date)"
