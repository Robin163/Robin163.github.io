---
layout: post
title:  "operate app by python"
date:   2018-09-16 11:48:42 +0800
categories: cmd
---
# Content

<!-- vim-markdown-toc GFM -->

* [Target:](#target)
* [Result:](#result)
* [Method:](#method)
	* [1. install python](#1-install-python)
	* [2. get mouse keypoint](#2-get-mouse-keypoint)
	* [3. create operate script](#3-create-operate-script)
	* [3. create data script](#3-create-data-script)
	* [4. another example](#4-another-example)
	* [5. pay attention](#5-pay-attention)

<!-- vim-markdown-toc -->

# Target:
when develop embedded system, I want to get some parameter from PC by Uart,

also the parameter have been calculated!

the Serial port tools can send data, but can't calculated the parameter.

python can give me a hand.

# Result:
input "com" 3 letters in windows command line(CLI), then my Serial port tools will be open，

then simply configure the App and drag to the left top of screen.

after that, In CLI input command "data" to call another script,

when you input data like "15342", then the data change to Hex,

and put the data to Serial port tool, auto-send data out by UART

![com-afterData](https://github.com/Robin163/robin163.github.io/raw/master/css/com-afterData.jpg )

# Method:
## 1. install python
They have many posts to introduce "how to install python"， I don't write it any more,

give your some website to learn about this:

[廖雪峰官网--python](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014316090478912dab2a3a9e8f4ed49d28854b292f85bb000)

[python环境搭建](https://www.runoob.com/python/python-install.html)

## 2. get mouse keypoint
a. create a path "C:\other\shell", and put the path into System Environment variables follow previous post.

b. create a file name "getmouse.py" and put code in it

{% highlight ruby %}
#!/usr/bin/python3
import sys
import os
import os.path
import shutil
import openpyxl
import pyautogui

print("====== Start App GetMouse ========")
print("Press Ctrl-C to quit.")
try:
    while True:
        #Get and print the mouse coordinate.
        x,y=pyautogui.position()
        positionStr = 'X:' + str(x).rjust(4) + 'Y:' + str(y).rjust(4)
        print(positionStr, end='')
        print('\b' * len(positionStr), end='', flush=True)
except KeyboardInterrupt:
    print('\nDone.')
print("====== end App GetMouse ========")
{% endhighlight %}

save the file.

open Serial port tool

![com-open](https://github.com/Robin163/robin163.github.io/raw/master/css/com-open.jpg )

![com-dragTo](https://github.com/Robin163/robin163.github.io/raw/master/css/com-dragTo.jpg )

then input command "getmouse" to start python App

get the keypoint position 1~5:

1. clearField = (990,566)

2. fromPoint= (766,195)

3. toPoint = (452,15)

4. asciiPoint = (134,264)

5. backPoint = (660,200)

then "Ctrl+C" exit the python App.

## 3. create operate script
create a file with name "com.py", and put the code into it

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

save the file.

then test it:

input command "com" in CLI, then the Serial port tool will be show like below

![com-afterConfig](https://github.com/Robin163/robin163.github.io/raw/master/css/com-afterConfig.jpg )

## 3. create data script
create a file with name "data.py", and put the code into it

{% highlight ruby %}
#!/usr/bin/python3
import sys
import os
import os.path
import shutil
import openpyxl
import pyautogui
print("===== start com handler =======")
pyautogui.PAUSE = 0.3
pyautogui.FAILSAFE = True
clearField = (60,265)
dataField = (260,444)
keyField1 = (172,406)
keyField2 = (172,444)
keyField3 = (172,480)
backField = (1500,250)

os.chdir('C:/other/shell')
for i in range(100):
    data = input("please input data:")
    data = int(data)
    wb = openpyxl.load_workbook('example.xlsx')
    sheet = wb['Sheet']
    sheet.cell(row=(i+1),column=5).value = data
    wb.save('example.xlsx')
    highdata = data >>0x08
    lowdata = data&0x00ff
    print('%x' % data)
    print('%x' % highdata)
    print('%x' % lowdata)
    pyautogui.click(clearField,button='left')
    pyautogui.click(dataField,button='left')
    pyautogui.typewrite(['backspace','backspace','backspace'])
    pyautogui.typewrite('%x' % highdata)
    pyautogui.press('tab')
    pyautogui.typewrite(['backspace','backspace','backspace'])
    pyautogui.typewrite('%x' % lowdata)
    pyautogui.click(keyField1,clicks=2,interval=0.3,button='left',duration=0.3)
    pyautogui.press(['tab','enter'])
    pyautogui.press(['tab','enter'])
    pyautogui.click(backField,button='left')
print("====== end com handler ========")
{% endhighlight %}

save the file.

then test it:

a. drag the CLI to right side of screen

b. input command "data" to call data scipt

c. input data "15432", then the script change data to "3C48",
	and put the data into Serial port tool, then send data to PC out by UART.

![com-afterData](https://github.com/Robin163/robin163.github.io/raw/master/css/com-afterData.jpg )

## 4. another example
create a file name "hyp.py" in path "C:/other/shell", and put code into it

{% highlight ruby %}
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import time
import subprocess
import pyautogui
pyautogui.PAUSE = 1
pyautogui.FAILSAFE = True

cancelPoint = (812,670)
manuPoint = (265,300)
confFile = (505,460)
openPoint = (860,844)
print( "Start APP 超级终端" )
subprocess.Popen ( "D:/Common Tools/HyperTerminal/hypertrm.exe" )
time.sleep(2)
pyautogui.press('tab',presses=3,interval=0.5)
pyautogui.press('enter')
pyautogui.keyDown('alt')
pyautogui.press('f')
pyautogui.press('o')
pyautogui.keyUp('alt')
pyautogui.typewrite('123.ht')
pyautogui.press('enter')
print( "Successfully Opened the App" )
{% endhighlight %}

## 5. pay attention
a. all the created files should put into path "C:/other/shell", for the path have been added to System Environment Variable.

b. the python version is 3.



[**HomePage**](https://robin163.github.io/)

