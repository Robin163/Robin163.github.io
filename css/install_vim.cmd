@echo off
echo ======start create diraction========
::set /p dir=please input your address>>
::echo your root address is %dir%
set dir=D:\program
md %dir%\home
md %dir%\vim

::install vim before the batch
echo please install vim.exe
pause

xcopy .\home  %dir%\home /t/e/h
xcopy .\vim   %dir%\vim  /t/e/h
copy  .\filetype.vim  %\vim\vim80

echo add %dir%\vim\ctags58 to environment path
echo add %dir%\vim\cscope to environment path

::install Git before the batch
echo please install Git.exe
echo and add %dir%\Git\cmd to environment path
pause

::install 7z before the batch
echo please install 7z.exe
echo and add %dir%\7-Zip to environment path
pause

::install cmake before the batch
echo please install cmake.exe
echo and add %dir%\cmake\bin to environment path
pause

::install LLVM before the batch
echo please install LLVM.exe
echo and add %dir%\LLVM\bin to environment path
pause

::install python before the batch
echo please install python.exe
echo and add %dir%\Python35 to environment path
echo and add %dir%\Python35\Scripts to environment path
pause

::install visual studio before the batch
echo please install visual studio.exe
pause

::check install ok or not
cd %dir%\vim\bundle\YouCompleteMe
git submodule update --init --recursive
pause

::compile the complete files
cd %dir%\vim\bundle\YouCompleteMe
.\install.py --clang-completer
pause

::add help tags
echo helptags %dir%\home\vimfiles\doc
pause

echo ===============end==================
