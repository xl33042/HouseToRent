@echo off
echo.
echo [信息] 安装工程。
echo.

%~d0
cd %~dp0

cd ..
npm install --registry=https://registry.npm.taobao.org

pause