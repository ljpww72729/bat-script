@echo on
::文件生成位置，可自定义，如格式：E:\lipeng-bj
set generatePah=%USERPROFILE%\Desktop
set new="%path:;=" "%"
SETLOCAL ENABLEDELAYEDEXPANSION
for %%I in (%new%) do echo %%~I | findstr /ic:"platform-tools" > nul && if !errorlevel! equ 0 echo %%~I>temp.txt
ENDLOCAL
set /p result=<temp.txt
del temp.txt
if "%result%"=="" (
echo "platform-tools的环境变量未配置，请配置至path中"
) else (
pushd %result%\systrace
echo 正在生成Systrace文件，请稍后。。。
REM 目的是开启一个com.udinic.keepbusyapp应用程序占用CPU，注意platform-tools必须配置到环境变量中
adb shell am broadcast -a com.udinic.keepbusyapp.ACTION_KEEP_BUSY
python systrace.py --time=10 -o %generatePah%\mynewtrace.html sched gfx view wm
echo 文件生成成功，已保存至桌面
popd
)


