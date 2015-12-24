@echo on
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "delims=" %%a in ('dir /a-d /b *') do (
echo %%a | findstr "\." > nul & if !errorlevel! neq 0 (
del %%a
)
)
pause