@echo off&setlocal enabledelayedexpansion
for /f "delims=" %%i in ('dir /a-d /b *.*') do (
echo %%i | findstr /r "[, ]*" > nul && if !errorlevel! equ 0 (
set "foo=%%~nxi"
set foo=!foo:,=!
set foo=!foo: =!
ren "%%~fi%" !foo!
)
)
endlocal
pause
exit