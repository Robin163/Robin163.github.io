---
layout: post
title:  "打造高效的windows"
date:   2018-10-15 17:48:42 +0800
categories: cmd
---
[ clover ](http://cn.ejie.me/)

让资源管理器像chrome一样显示，方便不同路径切换。

[ Listary ](https://www.listary.com/)

在资源管理器中可以自由打开任意文件和路径，十分方便快捷。

[ wox ](http://www.wox.one/) & [ Everything ](http://www.voidtools.com/)

打开任何应用程序和chrome 搜索引擎，还有计算器，字典翻译，都很方便。

[ cmder ](http://cmder.net/)

替代cmd的应用，可以配置类是linux下的guake，还能自动补全路径，very nice！

[ lantern ](https://github.com/getlantern/lantern)

和谐软件，有了它你就可以google了。记得每月有100M 的免费流量。

[ vimium ](https://github.com/philc/vimium)

让你像操作vim一样，来操作chrome，黑客级插件，让你有飞一样的感觉！

不过插件被屏蔽了，只能用源码编译后再用^_^

首先下载源码，在linux下编译成功后再copy 到相应的目录里， 具体操作如下：

{% highlight ruby %}
#install vimium

sudo apt-get install npm

sudo npm install --global coffeescript

sudo npm install --global coffeescript@1.12.7

cd vimium

cake build

#Chrome/Chromium

Navigate to chrome://extensions

Toggle into Developer Mode

Click on "Load Unpacked Extension..."

Select the Vimium directory.

#Firefox

Open Firefox

Enter "about:debugging" in the URL bar

Click "Load Temporary Add-on"

Open the Vimium directory and select any file inside.
{% endhighlight %}

[gvim](https://www.vim.org/)

windows下安装vim有点麻烦，不过只要安装成功你就不会后悔，

让键盘在指尖跳动，让你的编程柔顺丝滑，从此欲罢不能！

详细的gvim安装和应用见：

[gvim安装和应用](https://github.com/Robin163/robin163.github.io/raw/master/css/install_vim.cmd )

注意：

1. 安装路径不能有空格和特殊符号

2. phthon，LLVM，Cmake要和windows的位数一致（32bits还是64bits）

3. phthon，LLVM，Cmake要和vim版本兼容。在vim中，输入“”：version“”就可以显示相关信息



[**HomePage**](https://robin163.github.io/)

