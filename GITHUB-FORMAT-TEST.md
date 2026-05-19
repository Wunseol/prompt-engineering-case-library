# GitHub Markdown 格式兼容性测试

> 本文档用于测试各种字号、颜色方案在 GitHub 上的渲染效果。请对照查看。

---

## 一、缩小字号方案

### 1.1 `<small>` 标签

<small>这是 small 标签文字</small>

正常文字对比

### 1.2 `<sub>` 下标

<sub>这是 sub 下标文字</sub>

正常文字对比

### 1.3 `<sup>` 上标

<sup>这是 sup 上标文字</sup>

正常文字对比

### 1.4 `<small>` 嵌套

<small><small>双重 small</small></small>

<small><small><small>三重 small</small></small></small>

正常文字对比

### 1.5 `<small>` + 斜体

<small>*这是 small + 斜体文字*</small>

正常文字对比

---

## 二、放大字号方案

### 2.1 `<big>` 标签

<big>这是 big 标签文字</big>

正常文字对比

### 2.2 `<big>` 嵌套

<big><big>双重 big</big></big>

正常文字对比

### 2.3 标题字号

# H1 标题
## H2 标题
### H3 标题

正常文字对比

---

## 三、改颜色方案

### 3.1 `<font color="">` 标签

<font color="gray">font color=gray</font>

<font color="#888">font color=#888</font>

<font color="#aaa">font color=#aaa</font>

<font color="green">font color=green</font>

<font color="red">font color=red</font>

<font color="blue">font color=blue</font>

正常文字对比

### 3.2 `<font color="">` + `<small>`

<small><font color="gray">small + font color=gray</font></small>

<font color="gray"><small>font color=gray + small</small></font>

正常文字对比

### 3.3 `<mark>` 高亮

<mark>这是 mark 高亮文字</mark>

正常文字对比

### 3.4 `<del>` 删除线（视觉上变灰）

<del>这是 del 删除线文字</del>

<small><del>small + del 删除线</del></small>

正常文字对比

### 3.5 `<ins>` 下划线

<ins>这是 ins 下划线文字</ins>

正常文字对比

### 3.6 `<kbd>` 键盘样式

<kbd>这是 kbd 键盘样式文字</kbd>

正常文字对比

### 3.7 引用块 `>`

> 这是引用块文字

正常文字对比

### 3.8 代码反引号

`这是代码反引号文字`

正常文字对比

---

## 四、组合方案：提示词标识

### 方案 A：`<small>` 纯缩小

<small>提示词：</small>

**你是一位{角色描述}。**

---

### 方案 B：`<small>` + `<font color="gray">`

<small><font color="gray">提示词：</font></small>

**你是一位{角色描述}。**

---

### 方案 C：`<small>` + `<del>`（删除线模拟灰色）

<small><del>提示词：</del></small>

**你是一位{角色描述}。**

---

### 方案 D：`<small>` + 斜体

<small>*提示词：*</small>

**你是一位{角色描述}。**

---

### 方案 E：引用块

> 提示词：

**你是一位{角色描述}。**

---

### 方案 F：代码反引号

`提示词：`

**你是一位{角色描述}。**

---

### 方案 G：`<kbd>`

<kbd>提示词：</kbd>

**你是一位{角色描述}。**

---

### 方案 H：`<font color="gray">` 不加 small

<font color="gray">提示词：</font>

**你是一位{角色描述}。**

---

### 方案 I：`<font color="#888">` + `<small>`

<font color="#888"><small>提示词：</small></font>

**你是一位{角色描述}。**

---

## 五、组合方案：说明文字

### 方案 A1：`<small>` 纯缩小

<small>**适用场景**：{一句话说明}</small>

---

### 方案 B1：`<small>` + `<font color="gray">`

<small><font color="gray">**适用场景**：{一句话说明}</font></small>

---

### 方案 C1：`<small>` + 斜体

<small>*适用场景：{一句话说明}*</small>

---

### 方案 D1：引用块 + small

> <small>**适用场景**：{一句话说明}</small>

---

### 方案 E1：`<font color="gray">` 不加 small

<font color="gray">**适用场景**：{一句话说明}</font>

---

## 六、完整模板效果对比

### 模板 1：`<small>` 纯缩小（当前方案）

<small>提示词：</small>

**你是一位高效的团队协作者。**

**根据以下工作记录，生成本周工作周报。**

**约束：**
- 只包含本周完成的核心任务
- 300字以内
- 语气专业简洁

**输出格式：**
## 本周进展
## 下周计划

<small>**适用场景**：每周五下班前快速生成周报</small>

---

### 模板 2：`<small>` + `<font color="gray">`

<small><font color="gray">提示词：</font></small>

**你是一位高效的团队协作者。**

**根据以下工作记录，生成本周工作周报。**

**约束：**
- 只包含本周完成的核心任务
- 300字以内
- 语气专业简洁

**输出格式：**
## 本周进展
## 下周计划

<small><font color="gray">**适用场景**：每周五下班前快速生成周报</font></small>

---

### 模板 3：`<small>` + 斜体

<small>*提示词：*</small>

**你是一位高效的团队协作者。**

**根据以下工作记录，生成本周工作周报。**

**约束：**
- 只包含本周完成的核心任务
- 300字以内
- 语气专业简洁

**输出格式：**
## 本周进展
## 下周计划

<small>***适用场景**：每周五下班前快速生成周报*</small>

---

### 模板 4：`<font color="gray">` 不加 small

<font color="gray">提示词：</font>

**你是一位高效的团队协作者。**

**根据以下工作记录，生成本周工作周报。**

**约束：**
- 只包含本周完成的核心任务
- 300字以内
- 语气专业简洁

**输出格式：**
## 本周进展
## 下周计划

<font color="gray">**适用场景**：每周五下班前快速生成周报</font>
