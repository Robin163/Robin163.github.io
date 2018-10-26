---
layout: post
title:  "打造高效的ubuntu"
date:   2018-10-26 17:48:42 +0800
categories: cmd
---

[ virtualbox ](https://www.virtualbox.org/)

在windows下安装虚拟机，为学习ubuntu带来无限方便，同时也节省了电脑的钱^_^

[ ubuntu ](https://www.ubuntu.com/download/desktop)

虚拟机中安装ubuntu，网上很多教材。

注意：存储空间不能是默认的10G，很容易空间不够用而当机。我设定了100G。

开机对ubuntu basic 设置：

{% highlight ruby %}
#update and upgrade linux
sudo apt-get update
sudo apt-get upgrade

#add shared file mode to user Robin
whoami
#:robin
cat /etc/group | grep vbox
#:vboxsf:x:999:robin
sudo usermod -a -G vboxsf robin

#copy config file from shared path
cp -r /media/sf_other/conf_ubt ./
#if want to execute the file
chmod +x conf_ubt
./conf_ubt
{% endhighlight %}

# 安装vim，git，guake...

{% highlight ruby %}
sudo apt-get install ack ctags wmctrl vim vim-gnome guake
#dos and unix format switch
sudo apt-get install dos2unix
#astyle
sudo apt-get install astyle
#minicom
sudo apt-get install minicom

#install git and vundle
sudo apt-get install git-core
#my self files include shell script and vim script
cp -r /media/sf_other/.vim ./
cp -r /media/sf_other/shell ./
{% endhighlight %}

# 安装YoucompleteMe

{% highlight ruby %}
#install youcompleteMe
sudo apt install build-essential cmake python3-dev
#install vim plugin
put .vimrc into /home/robin
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --clang-completer
{% endhighlight %}

# 配置guake

{% highlight ruby %}
#config guake terminal
#preference->appearance->font:Monospace 14 & schemes:Monokai
#guake open when pc start
#startup application->add /usr/bin/guake
{% endhighlight %}

# 安装gcc-arm-none-eabi

{% highlight ruby %}
#install gcc-arm none-eabi
#(should NOT install apt-get for not the latest one, for printf not working)
sudo apt-get install lsb-core
sudo cp -r /media/sf_other/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 ./library
cd library/ ;
tar -jxvf ../gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2 ./
#add path to /etc/profile
export PATH=$PATH:/home/robin/library/gcc-arm-none-eabi-5_4-2016q3/bin
source /etc/profile
#check install success
arm-none-eabi-gcc -v
{% endhighlight %}


# 安装libusb

{% highlight ruby %}
#install libusb
#first way
sudo apt-cache search libusb
sudo apt-get install libusb-1.0-x
#second way
sudo cp -r /media/sf_other/libusb-1.0.22.tar.bz2 ./library
tar -jxvf libusb-1.0.22.tar.bz2
cd library/libusb-1.0.22
./configure
make
sudo make install
{% endhighlight %}


# 安装openocd

{% highlight ruby %}
#install openocd
#first way
sudo apt-cache search openocd
sudo apt-get install openocd libusb++-dev
#second way
sudo cp -r /media/sf_other/openocd-0.10.0.zip ./library
unzip openocd-0.10.0.zip
cd library/openocd-0.10.0
./configure
make
sudo make install
{% endhighlight %}

# 配置中文输入法
{% highlight ruby %}
#setting language
Setting ->> Region&Language ->>Manage Installed Language
->>Keyboard input Method system:fcitx
#install fcitx
sudo apt-get install fcitx-table-wbpy
sudo apt-get update
sudo apt-get upgrade
#restart PC
config input
configure input Method only keep 2 ways: English and Pinyin
{% endhighlight %}

# 截图工具

{% highlight ruby %}
# handle images
sudo apt-get install shutter
{% endhighlight %}

# vim中写博客

{% highlight ruby %}
#handle website
sudo apt-get install ruby
sudo gem install jekyll
sudo apt-get install python-pip
pip install pyments
{% endhighlight %}

# 配置vim中的中英文字体

{% highlight ruby %}
install yahei_consolas_hybird in gvim
{% endhighlight %}

[vimrc参考](https://github.com/Robin163/robin163.github.io/blob/master/css/.vimrc?raw=true)

# 截取动态图的工具

{% highlight ruby %}
# install gif make
sudo add-apt-repository ppa:djcj/hybrid
sudo apt-get update
sudo apt-get install ffmpeg
# install gif make
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek
{% endhighlight %}

# 安装黑客级chrome插件

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


[安装list](https://github.com/Robin163/robin163.github.io/blob/master/css/conf_ubt?raw=true)

[**HomePage**](https://robin163.github.io/)

