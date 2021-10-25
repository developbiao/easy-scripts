@echo off 
rem Every day create daily log on workspace
rem format is makrdown *.MD
E:
cd \YOUR_WORKSPACE\
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%
set dirname=%m%%d%
md %dirname%
cd %dirname%
echo ##### 一、信息收集箱>"record_%date:~0,4%_%date:~5,2%_%date:~8,2%.md"
