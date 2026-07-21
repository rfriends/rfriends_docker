@echo off
:: .env を1行ずつ読み込んで変数にセットするだけ（#で始まる行は自動無視）
for /f "usebackq eol=# tokens=1* delims==" %%i in (".env") do (
    set "%%i=%%~j"
)
