---
layout: post
title:  "operate app by python"
date:   2018-09-16 11:48:42 +0800
categories: cmd
---

# Operate App in windows CLI
## Target:
input "com" 3 letters in windows command line(CLI), then my Serial port tools will be open.

after that, simply configure the App and drag to the left top of screen.

in CLI, input command "ckc10" to call another script.

when you input data like "15342", then the

## Result:
open :

![mail](https://github.com/Robin163/robin163.github.io/blob/master/css/mail.JPG?raw=true "backgroud")

operate:

interactive:




## Method:
### 1. install python
They have many posts to introduce "how to install python"

I don't write it any more,

give your some website to learn about this:

### 2. create operate script
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

### 3. create data script
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

#os.chdir(os.getcwd())
os.chdir('D:/other/shell')

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

save the file and put the file path into system Environment variable

### 4. working with Serial port tool
a. input command "com" in CLI to open the Serial port tool

b. drag the CLI to right side of screen, and input command "data" to call data scipt

c. input data "15432", then the script change data to "3C48",
	and put the data into Serial port tool, then send data to PC out by UART.
