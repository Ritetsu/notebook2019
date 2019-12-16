前面的简介和账号创建直接略过，从需要输入代码的部分开始：
### 3.1 使用前的准备

#### 创建账户（略）
#### 设置头像（略）

* #### 设置SSH Key
第一个问题出现了，什么是SSH Key呢？简单搜索了一下还挺复杂，但我的理解是GitHub通过SSH Key与本地的仓库相连接，也就是说我们在本地创建SSH Key然后用它连接到GitHub就行了。打开下载好的GitBash开始输入：
```Bash
$ ssh-keygen -t rsa -C "email@xxx.com"
```
运行完成后设置一下密码。设置完成后系统会告诉你id_rsa和id_rsa.pub的位置以及key的指纹和图像（fingerprint,randomart image）分别是什么。
其中id_rsa是私有密钥，id_rsa.pub是**公开密钥**，GitHub即通过**公开密钥**认证来连接已有仓库。

* #### 添加公开密钥
先通过：
```Bash
$ cat ~/.ssh/id_rsa.pub
```
查看自己的Key，然后在GitHub网页上找到Add SSH Key的入口，Title处输入密钥名称，Key部分粘贴Key内容即可。（注意Key不包括邮件但包括ssh-rsa）
完成后会收到提示邮件。

文中提到完成设置之后就可以用私人密钥与GitHub进行认证和通信了，即运行：
```Bash
$ ssh -T git@github.com
```
不过公开密钥和私有密钥的区别是什么呢？我搜了半天也没有找到明确的解释，我猜是公开密钥用来连接本地仓库和远程仓库，私人密钥来确认文件的传输吧。
