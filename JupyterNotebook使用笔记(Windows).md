* #### JupyterNotebook的安装与使用
在接触JupyterNotebook之前我有折腾过一阵子Anaconda，所以理所当然地打算通过Anaconda来使用。

首先Anaconda的Navigator里自带有JupyterNotebook，点击之后也能顺利使用。但是打开Jupyter之后的界面里有很多乱七八糟的文件，很不舒服，而且显然这是在默认路径底下，如果我在这样的环境下开始操作，怕是以后都找不到代码写到哪里去了。

所以第一步是**更改Jupyter的工作/储存环境**。

网上大部分的教程是先去找Jupyter的安装文件夹，如D:\Anaconda3\Scripts。

然后输入命令让Jupyter产生配置文件Jupyter_notebook_config.py。具体命令是打开cmd后：
```
cd D:\Anaconda3\Scripts
jupyter notebook --generate-config
```
执行完成后在C:\Users\yourname\.jupyter下找到刚才生成的.py文件即可。

**但是**我在.jupyter底下并没有找到这个文件！查了很多资料也没搞清楚原因，最有可能的结果我感觉是Anaconda和Python的版本问题或者我什么时候不小心删掉了关键文件（？）。所以选择了简单的解决办法，用conda重装一次Jupyter Notebook。

打开Anaconda Prompt，输入：
```
conda install jupyter notebook
```
系统提示有很多组件需要更新版本，直接输入y后enter。

再重复上面的产生配置文件操作，顺利找到Jupyter_notebook_config.py文件，然后通过Ctrl+F搜索找到：
```
#c.NotebookApp.notebook_dir=''
```
在''内填入你希望Jupyter Notebook的默认工作路径即可，例如我是：F:\_the_4th\Jupyter_Notebook。

最后再将Jupyter Notebook的快捷方式右键属性，把“目标”项中的%USERPROFILE%修改成刚才的默认工作路径就行啦。
