### 6.1 快捷施法
**1.显示快捷键：**

【Shift+/】

**2.通过URL直接查看分支间的差别：**

①分支4-0-stable和3-2-stable之间的差别：

https://github.com/rails/rails/ **compare/4-0-stabel...3-2-stable**

②查看master分支在最近7天内的差别：

https://github.com/rails/rails/ **compare/master@{7.day.ago}...master**

③查看master分支在2013年9月9日与现在的区别
https://github.com/rails/rails/ **compare/master@{2013-09-09}...master**

### 6.2 Issue的使用
**1.给Issue添加标签/里程碑，以及GFM语法。（略）**

**2.GFM的独有功能Tasklist语法：**

# 本日要做的任务
- [x] 早上8点以前起床
- [ ] 看完《怪诞心理学》并还回图书馆
- [ ] 学习时间超过5h
- [ ] 运动至少30min

**3.Close Issue：**

若一个处于OPEN状态的Issue处理完毕，可在该提交中以以下任意格式描述提交信息，从而Close该Issue：

fix#24 fixes#24 fixed#24 /fix可以换成close和resolve

### 6.3 Pull Request
**1.以.diff或.patch格式获取Pull Request：**

如下输入即可：

https://github.com/UserName/RepositoryName **/pull/28.diff** 28为Pull Request的编号#28

https://github.com/UserName/RepositoryName **/pull/28.patch**

**2.在Conversation引用评论：**

选中想要引用的部分，然后按【R】。

**3.Files Changed：**

该标签页可以查看当前Pull Request更改的内容以及前后的差别，但是默认情况下空格的改变也会高亮显示，不方便，可以在URL末尾添加：

“?w=1”

便不再显示空格的区别。
