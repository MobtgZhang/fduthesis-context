# fduthesis-context
欢迎使用复旦大学ConTEXt 论文模板！

本模板支持中英文的博士、硕士学位论文以及本科毕业论文撰写。借助于ConTEXt技术，本模板旨在提供简洁、规范、可定制的论文撰写环境。

## 模板组成
+ `frontmatter`: 前言
+ `bodymatter`: 正文
+ `backmatter`: 后记
+ `fduthesis.lmtx`: 主文件
+ `fduthesis.mikv`: ConTEXt宏包
+ `references.bib`: 参考文献
使用示例：
```tex
\startproduct fduthesis
\project project_fduthesis
\mainlanguage[cn]
\usemodule[zhfonts]
\usebtxdataset[references.bib]
\starttext
\startfrontmatter
    % 封面
    \input frontmatter/cover
    % 指导成员小组
    \input frontmatter/supervisors
    % 目录
    \TOC{目录}
    % 中文摘要
    \input frontmatter/abstract_cn
    % 英文摘要
    \input frontmatter/abstract_en
    % 符号表
    \input frontmatter/symbols
\stopfrontmatter
    
\startbodymatter
    \input mainmatter/ch01
    \input mainmatter/ch02
    \input mainmatter/ch03
    \input mainmatter/ch04
    \input mainmatter/ch05
    \input mainmatter/ch06
\stopbodymatter

\startbackmatter
    % 附录
    \input mainmatter/appendix
    % 参考文献
    \title{参考文献}
    \placelistofpublications
    % 攻读学位期间发表的学术论文
    \input mainmatter/publications
    % 致谢
    \input mainmatter/acknowledgements
    % 原创性声明
    \input mainmatter/declarations
\stopbackmatter

\startappendices
\null
\stopappendices
\stoptext
\stopproduct
```

## 重要提醒
1. 本模板基于ConTEXt 2019.05.27版本，请确保您的ConTEXt版本不低于此版本；
2. 本模板中的所有文件均为UTF-8编码，请确保您的编辑器支持UTF-8编码；
3. 本模板未经学校相关部门审核以及授权，使用之前请务必斟酌；
4. 本模板仍然在开发中，不能完全保证接口的稳定性，请考虑是否需要同步进行更新；
5. 任何由于使用本模板而引起的论文格式审查问题均与本模板作者无关。

## 贡献

如果您有任何建议或者意见，欢迎提交issue或者pull request。

## 许可证

本模板采用GNU GENERAL PUBLIC LICENSE v3.0许可证。
