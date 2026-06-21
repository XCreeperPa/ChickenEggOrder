# ChickenEggOrder

一个用 Lean 4 形式化“鸡和蛋谁先”问题的小项目。

项目在一个因果世界中建模鸡、蛋和先后关系：鸡生蛋，蛋孵鸡，
并且 `before` 是严格且可传递的先后关系。在这些假设下，项目证明：
鸡和蛋都不可能作为一个类别整体成为“第一”。

- `not_ChickenFirst`：不存在一只鸡先于所有蛋。
- `not_EggFirst`：不存在一颗蛋先于所有鸡。
- `both_not_first`：上述两个结论同时成立。

## 项目规范

本项目以简体中文为第一语言。面向人的文档、说明、注释、提交说明和
Issue / Pull Request 讨论应优先使用简体中文；必要时可以保留英文术语，
尤其是 Lean、Lake、GitHub Actions 和数学逻辑中的既有名称。

Lean 代码中的公开定义、定理名、文件名和包名可以继续使用英文或
Lean 社区常见命名风格，以保持接口稳定和工具兼容。

## 构建

```sh
lake build
```

## 运行

```sh
lake exe chickeneggorder
```

## 文件结构

- `ChickenEggOrder/Basic.lean`：世界结构、先后关系和因果假设。
- `ChickenEggOrder/Questions.lean`：定义 `ChickenFirst` 和 `EggFirst`。
- `ChickenEggOrder/FinalTheorems.lean`：最终定理及其 Lean 证明。
- `ChickenEggOrder.lean`：库入口模块。
- `Main.lean`：可执行目标入口。

## 核心模型

`World` 给出实体类型以及鸡、蛋、先后关系、下蛋关系和孵化关系。
`StrictWorld` 要求 `before` 反自反且可传递。
`StrictTotalWorld` 进一步要求任意两个实体在先后关系上可比较。
`CausalWorld` 加入鸡生蛋、蛋孵鸡、来源存在性和唯一性等因果约束。

`ClassPrecedes before A B` 表示：类别 `A` 中存在某个对象，
它先于类别 `B` 中的所有对象。

因此：

- `ChickenFirst W` 表示在世界 `W` 中存在一只鸡先于所有蛋。
- `EggFirst W` 表示在世界 `W` 中存在一颗蛋先于所有鸡。

最终证明表明，在 `CausalWorld` 的假设下，这两个命题都会导出
某个实体先于自身，从而与 `before` 的反自反性矛盾。

## 许可证

MIT
