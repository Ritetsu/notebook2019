## 5.1 推送至远程仓库  
之前的操作都是针对本地仓库在git上进行的，现在开始学习GitHub上的远程仓库操作。

* ### 添加远程仓库
首先在GitHub网站上建立新的仓库，注意一般不勾选自动建立README.md的选项，防止本地仓库与远程仓库失去“整合性”（当然也可以后期强制覆盖）。
然后将该仓库设置成本地仓库的远程仓库：

```{.python .input .Bash}
$ git remote add origin git@github.com:yourname/yourrepositories.git
```

这一步完成后Git会自动将远程仓库的名字设置为origin。

* ### 推送至远程仓库

```{.python .input .Bash}
$ git push -u origin master         #将当前分支内容推送给远程仓库的origin的master分支
```

注意此处“-u”参数的作用在于，将origin仓库的master分支设置为本地当前分支的上游（upstream），这使得未来通过git
pull从远程仓库获取内容时本地仓库的这个分支可以直接从origin-master获得内容。（只有第一次推送带参数-u，之后不用再带）
本地master以外的分支推送也是同理：

```{.python .input .Bash}
$ git checkout -b feature-B         #切换到分支B
$ git push -u origin feature-B      #推送分支B，即将本地的B分支推送到远程（origin）
```

## 5.2 从远程仓库获取
* ### 获取远程仓库
首先**切换到其他目录**下，准备将GitHub上的仓库clone到本地：

```{.python .input .Bash}
$ git clone git@github.com:yourname/yourrepositories.git
```

运行后我出现了Enter passphrase for key '/c/Users/Shinelon/.ssh/id_rsa':，直接输入密码继续。
（在其他目录下也要先git init建立仓库数据，否则这一步会报错！）
完成后本地仓库的master分支与远程仓库的master分支完全相同。

使用-
a参数可以同时查看本地仓库和远程仓库的分支信息：

```{.python .input .Bash}
$ git branch-a
```

* ### 获取远程某分支

```{.python .input .Bash}
$ git checkout -b feature-X origin/feature-Y
```

以远程仓库的分支Y为来源，在本地仓库中建立X分支。

## 5.3 向远程分支提交修改
一般情况下，如果要对自己/他人的远程分支提交修改，可以如下操作：

```{.python .input .Bash}
$ git checkout -b featrueX origin/featureY          #从远程获取Y分支
$ git diff                                          #在本地对X，即获取到的Y进行修改
$ git commit -am "xxx"                              #加入暂存区并提交，=add+commit
$ git push                                          #将本地X分支推送到Y
```

* ### 获取最新分支

```{.python .input .Bash}
$ git pull origin featureY
```

将本地的X通过Y更新到最新。

到这里书中关于推送的内容已经结束了，但是我还有一些问题，所以自己尝试解决一下：

####
1.在本地建立仓库直接新建文件夹，然后cd到目录下git init即可；远程则是GitHub网页建立新仓库。通过git
clone命令能够将origin（远程）的仓库直接克隆到本地，而本地到origin的push命令却只能push某个分支的内容到远程？
答：确实是这样，要推送全部分支到origin的话需要使用

```{.python .input .Bash}
$ git push -all origin                             #这样即是将本地所有分支都推送到了origin
```

#### 2.练习时创建了大量分支，本地和远程都有，要如何删除？

答：

```{.python .input .Bash}
$ git branch -d <BranchName>                       #删除了本地的BranchName分支
$ git push origin :<BranchName>                    #将一个空分支推送至远程BranchName，效果等同与删除远程BranchName
$ git push origin --delete <BranchName>            #真正的删除指令
```

#### 3.分支只能在本地之间切换吗？

答：是这样，而且研究了一下我发现git branch和git
checkout虽然在新建分支并切换的时候效果等同，但实际上branch就是一个新建的命令，checkout才是切换至某分支的指令。
更多简单的指令可以看看这个网址，感觉说的还比较详细：[Git教程](https://www.yiibai.com/git/git_push.html)。
###
4.今天在本地修改文件后同步到GitHub中，直接使用git commit -am '说明'
进行提交，结果出现了一点小bug，部分GitHub中的文件夹丢失了。具体原因还不是很清楚。

答：改用

```{.python .input .Bash}
$ git add .
$ git commit -m ' '
$ git push
```

另外补充一个git add的使用说明：![](gitadd.png)
