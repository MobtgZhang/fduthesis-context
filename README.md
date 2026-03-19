# fduthesis-context

复旦大学学位论文 ConTeXt 模板，严格遵循《复旦大学博士、硕士学位论文规范（2024 年 10 月修订版）》。

## 支持的论文类型

| 参数 | 说明 |
|------|------|
| `type=bachelor` | 本科毕业论文 |
| `type=master` | 硕士学位论文 |
| `type=doctor` | 博士学位论文 |
| `degree=academic` | 学术学位 |
| `degree=professional` | 专业学位 |

## 环境要求

- **TeX Live 2024** 或更新版本（包含 ConTeXt LMTX）
- **中文字体**：Source Han Serif CN（思源宋体）、Source Han Sans CN（思源黑体）

如系统未安装上述字体，可替换为 Noto Serif SC / SimSun 等字体，
并在 `fduthesis_env.tex` 中修改字体配置。安装或更换字体后，执行：

```bash
mtxrun --script fonts --reload
```

## 文件结构

```
fduthesis-context/
├── fduthesis.tex           # 主文件（论文信息配置与内容组织）
├── fduthesis_env.tex       # 环境定义（版式、字体、宏定义）
├── references.bib          # 参考文献数据库
├── Makefile                # 编译脚本
├── figures/                # 图片目录
├── frontmatter/            # 前置部分
│   ├── cover.tex           #   封面（封一）
│   ├── supervisors.tex     #   扉页（指导小组成员）
│   ├── toc.tex             #   目录
│   ├── abstract_cn.tex     #   中文摘要
│   ├── abstract_en.tex     #   英文摘要
│   └── symbols.tex         #   符号与缩略语表
├── bodymatter/             # 正文部分
│   ├── ch01.tex            #   第一章
│   ├── ch02.tex            #   第二章
│   ├── ch03.tex            #   第三章
│   ├── ch04.tex            #   第四章
│   └── ch05.tex            #   第五章
└── backmatter/             # 后置部分
    ├── appendix.tex        #   附录
    ├── publications.tex    #   攻读学位期间发表的学术论文
    ├── acknowledgements.tex#   致谢
    └── declarations.tex    #   独创性声明与授权声明
```

## 快速开始

### 1. 配置论文信息

编辑 `fduthesis.tex`，修改 `\setvariables [thesis] [...]` 中的各项参数：

```tex
\setvariables [thesis] [
  type=master,             % doctor / master / bachelor
  degree=academic,         % academic / professional
  title={你的论文中文标题},
  title-en={English Title},
  author={你的姓名},
  department={院系名称},
  major={专业名称},
  supervisor={导师姓名\quad 职称},
  date={2025 年 6 月},
  keywords={关键词一，关键词二},
  keywords-en={keyword1, keyword2},
  clc={TP391},
]
```

### 2. 编写论文内容

- 在 `frontmatter/abstract_cn.tex` 和 `frontmatter/abstract_en.tex` 中编写摘要
- 在 `bodymatter/` 目录下的各章文件中编写正文
- 在 `references.bib` 中管理参考文献
- 在 `backmatter/` 目录下编写附录、致谢等内容

### 3. 编译

```bash
make          # 单次编译
make twice    # 两次编译（更新目录和交叉引用）
make clean    # 清理辅助文件
make distclean# 清理所有生成文件
```

或直接执行：

```bash
context fduthesis.tex
```

## ConTeXt 常用排版方法

### 插入图片

ConTeXt 使用 `\externalfigure` 命令插入图片，支持 PNG、JPG、PDF 等格式。图片默认从 `figures/` 目录读取。

```tex
% 基本插入
\externalfigure[myimage.png][width=0.8\textwidth]

% 带编号和标题的图片（浮动体）
\placefigure
  [here]
  [fig:example]
  {这是图片标题}
  {\externalfigure[myimage.png][width=0.6\textwidth]}

% 引用图片
如图 \in[fig:example] 所示，……
```

并排放置多张图片：

```tex
\placefigure[here][fig:sidebyside]{两张并排图片}{
  \startcombination[2*1]
    {\externalfigure[fig1.png][width=0.45\textwidth]}{(a) 第一张}
    {\externalfigure[fig2.png][width=0.45\textwidth]}{(b) 第二张}
  \stopcombination
}
```

### 插入表格

ConTeXt 使用 `TABLE` 环境（自然表格）或 `tabulate` 环境排版表格：

```tex
% 自然表格（推荐）
\placetable[here][tab:example]{表格标题}{
  \bTABLE[frame=off]
    \setupTABLE[column][1][width=3cm]
    \setupTABLE[row][first][topframe=on,bottomframe=on,style=\bf]
    \setupTABLE[row][last][bottomframe=on]
    \bTR \bTD 列一 \eTD \bTD 列二 \eTD \bTD 列三 \eTD \eTR
    \bTR \bTD 数据1 \eTD \bTD 数据2 \eTD \bTD 数据3 \eTD \eTR
    \bTR \bTD 数据4 \eTD \bTD 数据5 \eTD \bTD 数据6 \eTD \eTR
  \eTABLE
}

% 引用表格
如表 \in[tab:example] 所示，……
```

### 数学公式

ConTeXt 支持行内公式和行间公式，公式按章编号：

```tex
% 行内公式
这里有一个公式 $E = mc^2$。

% 行间编号公式
\placeformula[eq:euler]
\startformula
  e^{i\pi} + 1 = 0
\stopformula

% 引用公式
由公式 \in[eq:euler] 可知，……

% 多行对齐公式
\placeformula
\startformula
  \startalign
    \NC f(x) \NC = ax^2 + bx + c \NR
    \NC      \NC = a(x - h)^2 + k \NR
  \stopalign
\stopformula
```

### 参考文献引用

在 `references.bib` 中添加文献条目，然后在正文中引用：

```tex
% 在文中引用
根据文献 \cite[author][ref:key] 的研究，……

% 或简单引用
详见 \cite[ref:key]。
```

### 交叉引用

ConTeXt 使用统一的引用机制：

```tex
% 设置标签
\chapter[ch:intro]{绪论}
\section[sec:background]{研究背景}

% 引用
见第 \in[ch:intro] 章第 \in[sec:background] 节。
见 \at{第}[ch:intro] 页。
```

### 脚注

```tex
正文内容\footnote{这是一条脚注。}。
```

### 代码排版

```tex
% 行内代码
使用 \type{print("hello")} 函数输出信息。

% 代码块
\starttyping
def hello():
    print("Hello, World!")
\stoptyping
```

### 列表

```tex
% 有序列表
\startitemize[n]
  \item 第一项
  \item 第二项
\stopitemize

% 无序列表
\startitemize
  \item 第一项
  \item 第二项
\stopitemize
```

## 论文规范要点

根据《复旦大学博士、硕士学位论文规范（2024 年 10 月修订版）》：

- **纸张**：A4
- **正文字体**：宋体、小四号（12pt）、标准字符间距、行距 20 磅
- **页边距**：上下 2.54 cm，左右 3.18 cm（Word 默认值）
- **参考文献**：符合 GB/T 7714—2015 国家标准
- **封面**：严格按照规范附件中的标准样本制作
- **封三**：独创性声明和使用授权声明

## 论文内容顺序

1. 论文封面（封一）
2. 扉页：指导小组成员名单
3. 目录
4. 中文摘要（关键词，中图分类号）
5. 英文摘要（关键词，中图分类号）
6. 符号与缩略语表（如有）
7. 正文
8. 参考文献
9. 附录（如有）
10. 攻读学位期间发表的学术论文
11. 致谢
12. 独创性声明与授权声明（封三）

## 涉密论文

涉密论文需设置密级：

```tex
\setvariables [thesis] [
  secret-level={秘密},
  secret-year={五年},
]
```

密级和保密年限将显示在封面右上角。

## 参考项目

- [fduthesis](https://github.com/stone-zeng/fduthesis) — 复旦大学 LaTeX 学位论文模板

## 许可证

本项目采用 [GNU General Public License v3.0](LICENSE) 许可证。
