@echo on
REM 该命令用于替换某个文件中的特定行的逗号，替换成-->字符
echo %cd%
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "delims=" %%f in ('dir /a-d /b *.srt') do (
set n=0
for /f "delims=" %%i in (%%f) do (
REM 如果满足条件则进行替换
echo %%i | findstr /r "^[0-9].*" > nul && if !errorlevel! equ 0 (
set str=%%i
set "str=!str:,= --> !" 
set /a n=n+1
echo !n!>>%%~nf_temp%%~xf
echo !str!>>%%~nf_temp%%~xf
)
REM 如果不满足条件则不进行替换
if !errorlevel! neq 0 (
set strbr=%%i
set "strbr=!strbr:[br]=\n!" 
echo !strbr!>>%%~nf_temp%%~xf
echo.>>%%~nf_temp%%~xf
)
)
del %%f
rename "%%~nf_temp%%~xf" "%%f"
)
for /f "delims=" %%a in ('dir /a-d /b *') do (
echo %%a | findstr "\." > nul & if !errorlevel! neq 0 (
del %%a
)
)
ENDLOCAL
pause
exit