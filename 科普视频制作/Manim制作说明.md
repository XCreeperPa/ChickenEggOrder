# Manim 制作说明

## 视觉风格

视频正文建议使用 Manim 自绘符号化资产，而不是复杂写实素材。

原因：

- 鸡和蛋在视频里代表形式系统中的对象，不是现实生物插图。
- 简洁几何图形更适合表达谓词、关系、箭头和证明链。
- 自绘资产版权最干净，风格也最统一。

## 基础对象

### 蛋

用米白色椭圆表示：

```python
egg = Ellipse(width=1.0, height=1.35)
egg.set_fill("#F6E8C8", opacity=1)
egg.set_stroke("#5C4630", 3)
```

### 鸡

用基础图形拼接：

- 身体：白色椭圆
- 头：白色圆形
- 鸡冠：红色小圆或小弧
- 嘴：黄色三角形
- 眼睛：黑点
- 脚：短线

建议保持轻量，不追求写实。

### 关系箭头

用不同颜色区分语义：

| 关系 | 建议颜色 | 说明 |
|---|---|---|
| `before` | 蓝色 | 普通先后关系 |
| `lays` | 橙色 | 鸡生蛋 |
| `hatches` | 绿色 | 蛋孵鸡 |
| 矛盾 | 红色 | `x before x` 自环 |

## 核心动画段落

### 1. 自然语言拆解

将“鸡”“蛋”“先于”“下蛋”“孵化”等词语逐步变成形式符号：

```text
鸡 -> isChicken x
蛋 -> isEgg x
先于 -> before x y
下蛋 -> lays c e
孵化 -> hatches e c
```

### 2. 命题形成

展示：

```lean
def ChickenFirst (W : CausalWorld) : Prop :=
  ClassPrecedes W.before W.isChicken W.isEgg
```

旁白解释：

> “鸡先”在这里不是泛泛而谈，而是存在某一只鸡，它先于所有蛋。

### 3. 反证法证明链

动画顺序：

```text
假设 ChickenFirst
      ↓
取第一只鸡 c
      ↓
找到孵出 c 的蛋 e
      ↓
e before c
      ↓
c before e
      ↓
c before c
      ↓
矛盾
```

这里可用节点图展示，最后让 `c before c` 变成红色自环。

### 4. Lean 验证

展示终端：

```text
lake build
Build completed successfully
```

可用重制终端画面，不一定要直接屏录。

### 5. Agent 辅助证明

用简化界面展示：

```text
用户：Codex，证明这个命题！
Agent：构造反证法，寻找孵化来源，应用传递性...
Lean：Build completed successfully
```

重点不是表现 Agent 多聪明，而是表现：

> Agent 可以参与证明书写，但证明是否成立由 Lean 检查。

## 镜头节奏

- 开场哲思段落：慢，留白，配合 `Zeta`。
- 形式系统搭建：中速，逐步出现定义。
- 证明链：清晰、逐步推进，不要过快。
- Agent 段落：节奏稍快，体现现代工具感。
- 结尾：回到古今连接，收束到“可验证约束”。

## 字幕与代码

- 中文旁白和字幕是第一语言。
- Lean 代码保留英文标识符。
- 重要命题可以中英并列解释，但不要让屏幕文字过密。
- 代码不宜长时间整屏展示，应配合动画解释证明结构。

