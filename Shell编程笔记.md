考虑到已经把GitHub作为远程笔记储存处了，那么每天在Jupyter
notebook下写完东西都得到云服务器上一个个向GitHub更新属实有些麻烦，正好我也没写过linux的脚本，打算试一试实现简单快速地向GitHub更新每日内容。
### 组成：
#### 首行
第一行内容在脚本的首行左侧，表示的是将要调用的shell解释器，内容如下：

```{.python .input .Bash}
#!/bin/bash
```

其中#!符号能被内核识别为一个脚本的开始，故这一行必须位于脚本首行；/bin/bash则是bash程序的绝对路径，表示后续内容将通过bash程序解释执行。
#### 注释
注释符号为【#】，需放置在注释内容之前。

#### 内容
即书写可执行的内容。

### 说明：
#### 权限
一般情况下默认创建的脚本是没有执行权限的，但可以赋予：

```{.python .input .Bash}
# touch test.sh
# ll | grep test.sh
# chmod
+x test.sh
```

#### 执行
* 输入脚本的绝对路径或相对路径

```{.python .input .Bash}
# /root/test.sh
# ./test.sh
```

* bash或sh +脚本

```{.python .input .Bash}
# bash /root/test.sh
# sh test.sh
```

*
在脚本路径前加“..”或者source

```{.python .input .Bash}
# source /root/test.sh
# ../test.sh
```

区别：第一种和第二种会新开一个bash，不同bash中的变量无法共享。但是使用. ./脚本.sh 这种方式是在同一个shell里面执行的。
那么我的.sh内容应该是

```{.python .input}
for i in 'Python' 'Linux_LearningNotes'
do
  cd
/home/sayori/git_local/$i
  git add .
  git commit -m "regular update"
  git
push
done
```

测试了一下没有问题，唯一麻烦的是要输好几次密码。有能绕过密码直接提交的措施，不过我想还是保留这一层吧，至少自己每次提交前能看看做了什么改动，放心一点。
