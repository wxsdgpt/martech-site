# CONTENT.md - 内容规范与归档策略

## 内容定位

MarTech Hub 是一个面向营销科技从业者的精品资讯聚合站，
以「深度 + 前沿 + 实战」为内容准则，覆盖 MarTech、AdTech、支付科技三大板块。

## 每日内容标准

### 每日简报（5 条）
- 来源：AdWeek, AdExchanger, MarTech.org, The Drum, Digiday, 36kr, 虎嗅等
- 筛选标准：最近 24 小时内的重磅新闻
- 格式：标题 + 3-5 句中文摘要 + 标签(3-4个) + 原文链接
- 语言：专业但不晦涩，面向产品经理和营销决策者

### 深度分析（1-2 篇/周）
- 围绕趋势主题展开，800-1500 字
- 包含数据支撑和行业观点

### 工具测评（按需更新）
- 每周至少评估 1 个新工具
- 格式：功能亮点 + 适用场景 + 评分

## 数据归档结构

所有内容按天归档到 `data/` 目录：

```
data/
├── 2026/
│   ├── 03/
│   │   ├── 04.json    ← 每日数据文件
│   │   ├── 05.json
│   │   └── ...
│   └── ...
└── ...
```

### 每日数据文件格式 (data/YYYY/MM/DD.json)

```json
{
  "date": "2026-03-05",
  "weekday": "星期三",
  "news": [
    {
      "title": "标题",
      "summary": "中文摘要",
      "tags": ["MarTech", "AI"],
      "source": "AdWeek",
      "url": "https://...",
      "category": "daily"
    }
  ],
  "analysis": [],
  "tools": [],
  "meta": {
    "updated_at": "2026-03-05T09:00:00+08:00",
    "version": 1
  }
}
```

### 归档原则
1. **每日数据必须保存为独立 JSON 文件**，方便历史回溯
2. **index.html 始终展示最新一天的内容**，但保留"历史归档"入口
3. **所有变更通过 git commit 记录**，commit message 格式：
   `[YYYY-MM-DD] 每日更新：N条新闻 + 描述`
4. **数据文件和页面同步提交**

## 每日执行 Checklist

1. □ 搜索过去 24h 的 MarTech/AdTech 新闻（中英文）
2. □ 筛选 5 条最重磅新闻，翻译/总结为中文
3. □ 保存到 `data/YYYY/MM/DD.json`
4. □ 更新 `index.html`（日期 + 新闻内容 + 检查视觉效果）
5. □ 检查页面在浏览器中的渲染效果
6. □ `git add . && git commit -m "[YYYY-MM-DD] ..." && git push`
7. □ 思考是否有可改进的视觉元素或交互，记录到 CHANGELOG.md
