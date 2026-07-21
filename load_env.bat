@echo off
for /f "usebackq tokens=1* delims==" %%i in (`findstr /v "^#" ".env"`) do (
    set "%%i=%%~j"
)
