$path = "e:\Dev\DevWorkspace\prompt-engineering-case-library\04-AI办公写作\01-日常写作与办公提示词模板.md"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

function Norm($s) { return $s -replace "`r?`n", "`r`n" }

# === R1: 商务邮件 add OutputFormat + --- separator before 项目汇报邮件 ===
$old1 = Norm @'
**{补充背景信息}**

<small style="color:#888">提示词（项目汇报邮件）：</small>
'@
$new1 = Norm @'
**{补充背景信息}**

**输出格式：**
- 邮件主题：{{主题}}
- 称呼：{{收件人称呼}}
- 正文：{{正文}}
- 落款：{{发件人署名}}

---

<small style="color:#888">提示词（项目汇报邮件）：</small>
'@
if ($content.Contains($old1)) { $content = $content.Replace($old1, $new1); Write-Host "R1: OK" } else { Write-Host "R1: NOT FOUND" }

# === R2: 项目汇报邮件 add Constraints + OutputFormat ===
$old2 = Norm @'
**要求：语气专业简洁，重点突出，不超过300字。**
'@
$new2 = Norm @'
**约束：**
- 语气专业简洁，重点突出
- 不超过300字
- 风险和下一步计划分点列出

**输出格式：**
- 邮件主题：{{项目名}}-{{汇报周期}}进展汇报
- 称呼：{{收件人称呼}}
- 核心进展：分点列出
- 当前风险：如有则列出，附应对建议
- 下一步计划：分点列出
- 落款：{{发件人}}
'@
if ($content.Contains($old2)) { $content = $content.Replace($old2, $new2); Write-Host "R2: OK" } else { Write-Host "R2: NOT FOUND" }

# === R3: 公文写作 add OutputFormat ===
$old3 = Norm @'
- 不超过500字

---

## 五、对比分析
'@
$new3 = Norm @'
- 不超过500字

**输出格式：**
- 标题：{{通知标题}}
- 主送：{{接收对象}}
- 正文：分点列出内容要点
- 落款：{{发文单位}}
- 日期：{{发文日期}}

---

## 五、对比分析
'@
if ($content.Contains($old3)) { $content = $content.Replace($old3, $new3); Write-Host "R3: OK" } else { Write-Host "R3: NOT FOUND" }

# === R4: 公众号文章 add OutputFormat ===
$old4 = Norm @'
等机械过渡词

<small style="color:#888">真实示例
'@
$new4 = Norm @'
等机械过渡词

**输出格式：**
- 标题：3个备选标题
- 开头：引人入胜的hook
- 正文：分小标题展开
- 结尾：明确的行动号召

<small style="color:#888">真实示例
'@
if ($content.Contains($old4)) { $content = $content.Replace($old4, $new4); Write-Host "R4: OK" } else { Write-Host "R4: NOT FOUND" }

# === R5: Wrap AI output in <small>, fix isolated >, escape #, add --- before 小红书笔记 ===
$old5 = Norm @'
# 3个AI技巧，让你的工作效率翻倍（不是标题党）
>
"小李，这份报告下午5点前能交吗？"
"没问题！"
>
以前说这话心虚，现在——AI就是我的底气。...
>
## 一、让AI帮你"读"完100页文档
很多人拿到长文档，第一反应是从头读到尾。
错！正确做法是先让AI帮你"扫描"一遍。...
>
## 二、让AI帮你"写"第一版草稿
与其盯着空白文档发呆，不如让AI先写个底稿。...
>
## 三、让AI帮你"查"你容易忽略的错
最后一遍自检，交给AI，它比你更认真。...

<small style="color:#888">提示词（小红书笔记）：</small>
'@
$new5 = Norm @'
<small style="color:#888">

\# 3个AI技巧，让你的工作效率翻倍（不是标题党）

"小李，这份报告下午5点前能交吗？"
"没问题！"

以前说这话心虚，现在——AI就是我的底气。...

\## 一、让AI帮你"读"完100页文档
很多人拿到长文档，第一反应是从头读到尾。
错！正确做法是先让AI帮你"扫描"一遍。...

\## 二、让AI帮你"写"第一版草稿
与其盯着空白文档发呆，不如让AI先写个底稿。...

\## 三、让AI帮你"查"你容易忽略的错
最后一遍自检，交给AI，它比你更认真。...

</small>

---

<small style="color:#888">提示词（小红书笔记）：</small>
'@
if ($content.Contains($old5)) { $content = $content.Replace($old5, $new5); Write-Host "R5: OK" } else { Write-Host "R5: NOT FOUND" }

# === R7: 小红书笔记 add OutputFormat + --- before 短视频脚本 ===
$old7 = Norm @'
- 300-500字

<small style="color:#888">提示词（短视频脚本）：</small>
'@
$new7 = Norm @'
- 300-500字

**输出格式：**
- 标题：含emoji，20字以内
- 正文：使用emoji分段，3-5个实用Tips
- 话题标签：3-5个相关标签

---

<small style="color:#888">提示词（短视频脚本）：</small>
'@
if ($content.Contains($old7)) { $content = $content.Replace($old7, $new7); Write-Host "R7: OK" } else { Write-Host "R7: NOT FOUND" }

# === R8: ### 模型选择策略 -> ### 8.1 + fix isolated > ===
$old8 = Norm @'
### 模型选择策略

<small style="color:#888">不同任务场景下选择合适的AI模型可以显著提升效率：</small>
>
<small style="color:#888">复杂推理与规划任务（如需求拆解、方案设计、代码架构）：</small>
<small style="color:#888">优先选择推理能力强的模型（如 GLM-5、Qwen3-Plus、DeepSeek-R1），确保规划质量。</small>
>
<small style="color:#888">日常执行任务（如格式转换、简单翻译、模板填充）：</small>
<small style="color:#888">可选择轻量快速模型（如 MiniMax、Qwen-Turbo），响应快、无需排队，降低成本。</small>
>
<small style="color:#888">串行任务管理：</small>
<small style="color:#888">建议分开窗口问答，一个窗口只处理一个任务，串行执行而非并行，避免上下文混乱。</small>
'@
$new8 = Norm @'
### 8.1 模型选择策略

<small style="color:#888">不同任务场景下选择合适的AI模型可以显著提升效率：</small>

<small style="color:#888">复杂推理与规划任务（如需求拆解、方案设计、代码架构）：</small>
<small style="color:#888">优先选择推理能力强的模型（如 GLM-5、Qwen3-Plus、DeepSeek-R1），确保规划质量。</small>

<small style="color:#888">日常执行任务（如格式转换、简单翻译、模板填充）：</small>
<small style="color:#888">可选择轻量快速模型（如 MiniMax、Qwen-Turbo），响应快、无需排队，降低成本。</small>

<small style="color:#888">串行任务管理：</small>
<small style="color:#888">建议分开窗口问答，一个窗口只处理一个任务，串行执行而非并行，避免上下文混乱。</small>
'@
if ($content.Contains($old8)) { $content = $content.Replace($old8, $new8); Write-Host "R8: OK" } else { Write-Host "R8: NOT FOUND" }

# === R9: Add 速查表 at the end ===
$old9 = '| 公文格式有标准吗？ | 有。党政机关公文格式参见 GB/T 9704，企业公文可参考其简化版 |' + "`r`n"
$new9 = Norm @'
| 公文格式有标准吗？ | 有。党政机关公文格式参见 GB/T 9704，企业公文可参考其简化版 |

---

## 提示词速查表

| 序号 | 标题 | 适用场景 | 使用方式 |
|------|------|----------|----------|
| 1 | 周报生成 | 每周工作总结 | 通用 |
| 2 | 会议纪要整理 | 会议记录整理 | 通用 |
| 3 | 商务邮件 | 商务沟通邮件 | 通用 |
| 4 | 项目汇报邮件 | 项目进展汇报 | 通用 |
| 5 | 公文写作 | 通知/公告/请示 | 通用 |
| 6 | 对比分析 | 技术选型/方案评估 | 通用 |
| 7 | 公众号文章 | 内容创作 | 通用 |
| 8 | 小红书笔记 | 社交媒体内容 | 通用 |
| 9 | 短视频脚本 | 短视频制作 | 通用 |
'@
$new9 = $new9 + "`r`n"
if ($content.Contains($old9)) { $content = $content.Replace($old9, $new9); Write-Host "R9: OK" } else { Write-Host "R9: NOT FOUND" }

# Write back with UTF-8 (no BOM) and preserve CRLF
[System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))

# Verification
$lines = $content -split "`r`n"
$roleCount = ([regex]::Matches($content, '\*\*Role:\*\*')).Count
$outputFormatCount = ([regex]::Matches($content, '\*\*输出格式')).Count
$hasQuickTable = $content.Contains('## 提示词速查表')
$has81 = $content.Contains('### 8.1 模型选择策略')
$isolatedGT = 0
foreach ($l in $lines) {
    if ($l.Trim() -eq '>') { $isolatedGT++ }
}

Write-Host ""
Write-Host "=== VERIFICATION ==="
Write-Host "Total lines: $($lines.Count)"
Write-Host "Role count: $roleCount"
Write-Host "OutputFormat count: $outputFormatCount"
Write-Host "Has quick table: $hasQuickTable"
Write-Host "Has 8.1: $has81"
Write-Host "Isolated > count: $isolatedGT"
