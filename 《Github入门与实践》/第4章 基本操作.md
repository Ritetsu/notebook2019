## 4.1 基本操作
* #### 本地仓库初始化
这部分是关于本地的Git仓库的基本操作。
首先打开GitBash，建立一个目录并初始化仓库：
```Bash
$ mkdir git-tutorial
$ cd git-tutorial
$ git init
```
成功后会生成.git目录，其内存放的便是管理当前目录内容所需的仓库数据。称之为“工作树”，文件编辑在工作树中进行，仓库内是记录和快照。
创建+初始化仓库完成后，可以查看其状态：
```Bash
$ git status
```
结果会显示①当前位置（分支）②有无可提交内容；显然新建的仓库肯定啥都没有。

于是建立一个README.md文件进行实验：
```Bash
#建立文件
$ touch README.md
$ git status
#把它添加到暂存区
$ git add README.md
$ git status
#保存历史记录
$ git commit -m "first commit"
$ git status
```
这里提到了git commit命令——保存仓库的历史记录，我记得之间用push把本地文件传到GitHub之前也有git commit命令，之前一直没搞清楚commit和push都是上传，为什么要进行两次呢。现在清楚了，commit提交的是“历史记录”，未来可以通过commit命令的记录复原文件。

* #### 关于提交日志
```Bash
$ git log                 #显示以往提交的hash值，提交人和时间。
$ git log --pretty=short  #不显示日期
$ git log README.md       #只显示与指定文件相关的日志
$ git log -p
$ git lop -p README.md    #只看某文件提交前后的差别
```
* #### 查看工作树、暂存区和最新提交的区别
```Bash
$ git diff            #对比工作区(未add)和暂存区(add之后),如果当前暂存区没有文件，就比较当前工作区和版本库(上一次commit之后)的差别
$ git diff HEAD       #对比工作区(未add)和暂存区（add但未commit），分别和版本库(上一次commit之后)
$ git diff --cached   #对比暂存区(add之后)和版本库(上一次commit之后)
```

## 4.2 分支的操作
```Bash
$ git branch                    #查看所有分支，*为当前所在
$ git checkout -b feature-A     #创建名为feature-A的分支并且切换到它
$ git branch feature-A          #效果等同
$ git checkout feature-A        #效果等同
```
在feature-A分支下对README.md修改，并不会影响master分支下的README.md，这就是Git分支的优点。
```Bash
$ git checkout -                #切换回上一个分支
$ git checkout master           #切回master,等同上一条
$ git merge --no-ff feature -A  #合并分支A至master
$ git log --graph               #图表输出日志
```

* ## 4.3 更改提交
处理文件的回溯，推进，以及提交信息错误或者是因为出现了简单的错误而不想占用过多历史空间的情况。
```Bash
$ git reset --hard hash值       #回复到某hash值的状态（所有文件）
$ git reflog                    #git log只能以当前状态为终点查看日志，而这可以看所有历史
$ git commit --amend            #修改提交信息（如之前的first commit）（Vim）
$ git rebase -i HEAD~2          #选定当前分支中包含HEAD（最新提交）在内的2个最新历史记录为对象，并在编辑器中打开
```
rebase提交后会出现：
pick hashA aaa
pick hashB bbb
……

若想将bbb的历史记录压缩到aaa里，将第二行的pick改成fixup后保存并关闭编辑器即可。
之后再将aaa分支与master合并，便省去了多合并一次bbb的历史。
