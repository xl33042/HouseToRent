@echo off
echo.
echo [��Ϣ] ��װ���̡�
echo.

%~d0
cd %~dp0

cd ..
npm install --registry=https://registry.npm.taobao.org

pause