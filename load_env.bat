@echo off
for /f "usebackq eol=# tokens=1* delims==" %%i in (".env") do (
    set "%%i=%%~j"
)
