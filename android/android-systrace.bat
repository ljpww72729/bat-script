@echo on
::�ļ�����λ�ã����Զ��壬���ʽ��E:\lipeng-bj
set generatePah=%USERPROFILE%\Desktop
set new="%path:;=" "%"
SETLOCAL ENABLEDELAYEDEXPANSION
for %%I in (%new%) do echo %%~I | findstr /ic:"platform-tools" > nul && if !errorlevel! equ 0 echo %%~I>temp.txt
ENDLOCAL
set /p result=<temp.txt
del temp.txt
if "%result%"=="" (
echo "platform-tools�Ļ�������δ���ã���������path��"
) else (
pushd %result%\systrace
echo ��������Systrace�ļ������Ժ󡣡���
REM Ŀ���ǿ���һ��com.udinic.keepbusyappӦ�ó���ռ��CPU��ע��platform-tools�������õ�����������
adb shell am broadcast -a com.udinic.keepbusyapp.ACTION_KEEP_BUSY
python systrace.py --time=10 -o %generatePah%\mynewtrace.html sched gfx view wm
echo �ļ����ɳɹ����ѱ���������
popd
)


