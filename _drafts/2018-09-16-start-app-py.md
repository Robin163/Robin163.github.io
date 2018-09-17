---
layout: post
title:  "start app chinese version"
date:   2018-09-16 11:48:42 +0800
categories: cmd
---

# windows命令行中 启动应用程序
##目的：
在windows的命令行界面中，输入简单的几个字符就可以启动相应的应用程序。

例如： 输入mail，E-mail就自行启动，十分方便。以后就不用在电脑桌面上放那么多菜：）

增强功能里包含：对开启的应用程序进行简单配置，然后通过命令可以对其操作。
##效果
![mail](https://github.com/Robin163/robin163.github.io/blob/master/css/mail.JPG?raw=true "backgroud")

##方法
以E-mail为例子来说明具体的实现方法
###1. 创建批处理脚本
创建路径C:\other\shell(根据自己爱好创建存放脚本的路径)

在此路径下新建一个文本文件，如mail.txt

在此文件中写入下面的代码

{% highlight ruby %}
@echo off
echo Start APP E-mail
start "dummyclient" "C:/Program Files (x86)/Microsoft Office/Office14/OUTLOOK.exe"
echo successfully open the App
{% endhighlight %}

此处的outlook路径要更该成你的！

保存文件，并把文件名更改为mail.cmd
###2. 设定环境变量
首先右键点击桌面上 "我的电脑" ->>"属性"->>"高级系统设置"->>"环境变量"->>"系统变量"

然后双击变量“”路径”，把C:\other\shell加入其中
###3. 测试功能
首先打开命令行cmd，快捷键"win+R" 输入"cmd" 按Enter键

然后在命令行中输入"mail"

E-mail 就会自行启动

特别注意文件名是和命令相关的。上面的文件名是mail.cmd, 命令名就是mail
###4. 扩展功能
按照方法中的1-3,我们同样可以启动其他应用程序，

只要新建一个文档gvim.cmd, 程序更改为：

{% highlight ruby %}
@echo off
echo Start APP gvim
start "dummyclient" "D:/program/vim/vim80/gvim.exe"
echo successfully open the App
{% endhighlight %}

###5. 增强功能
有的时候我们不仅要打开一个应用程序，而且希望能够在打开后简单的配置一下

如我希望打开串口调试助手，要接收ASCII（因为默认是16进制数据）并把窗口拖到左上角

要完成这样一系列动作，我们的windows命令已经无能为力了，需要借用python的功能

python的安装这里就不介绍了，网上到处都是：）

串口助手的界面如下：

这时我们需要创建com.cmd文件，程序如下：

{% highlight ruby %}
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import subprocess
import pyautogui

pyautogui.PAUSE = 1
pyautogui.FAILSAFE = True

clearField = (990,566)
fromPoint= (766,195)
toPoint = (452,15)
asciiPoint = (134,264)
backPoint = (660,200)

print( "Start APP 串口助手" )
subprocess.Popen ( "D:/Common Tools/多功能串口调试助手.exe" )
time.sleep(3)
pyautogui.click(clearField,button='left')
pyautogui.click(fromPoint,button='left')
pyautogui.dragTo(toPoint,duration=0.5)
pyautogui.click(asciiPoint,button='left')
pyautogui.click(backPoint,button='left')

print( "Successfully Opened the App" )
{% endhighlight %}

