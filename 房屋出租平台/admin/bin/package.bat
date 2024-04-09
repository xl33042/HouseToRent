@echo off
echo.
echo [信息] 打包Web工程。
echo.

%~d0
cd %~dp0

cd ..
npm run build:prod

pause