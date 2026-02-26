#!/bin/bash

# Martech Daily News Bot
# 每天早上 8 点执行：搜索 Martech/AdTech/支付科技 新闻，更新 index.html，推送到 GitHub

cd ~/.openclaw/workspace/mertech-site || exit 1

# 搜索最新资讯 (使用 web_search)
NEWS=$(web_search --freshness pd --count 10 --query "Martech AdTech payment technology advertising technology news 2026")

# 这里可以添加实际的新闻处理逻辑
# 目前先做一个占位更新

DATE=$(date "+%Y-%m-%d")

cat > index.html << EOF
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Martech 每日简报</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; background: #f5f5f5; }
        h1 { color: #333; border-bottom: 2px solid #007aff; padding-bottom: 10px; }
        .date { color: #666; font-size: 14px; margin-bottom: 20px; }
        .news-item { background: white; padding: 15px; margin-bottom: 15px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .news-item h3 { margin: 0 0 10px 0; color: #007aff; }
        .summary { color: #333; line-height: 1.6; }
        .tags { margin-top: 10px; }
        .tag { display: inline-block; background: #e8f4ff; color: #007aff; padding: 2px 8px; border-radius: 4px; font-size: 12px; margin-right: 5px; }
        .source { margin-top: 10px; font-size: 12px; color: #999; }
    </style>
</head>
<body>
    <h1>Martech 每日简报</h1>
    <p class="date">更新日期：${DATE}</p>
    
    <div class="news-item">
        <h3>正在获取最新资讯...</h3>
        <p class="summary">系统正在搜索过去 24 小时的 Martech、AdTech 和支付科技新闻。</p>
        <div class="tags"><span class="tag">Martech</span><span class="tag">AdTech</span></div>
    </div>

</body>
</html>
EOF

# Git 推送
git add index.html
git commit -m "Update: ${DATE}" || exit 0
git push origin main

echo "Martech daily task completed at ${DATE}"
