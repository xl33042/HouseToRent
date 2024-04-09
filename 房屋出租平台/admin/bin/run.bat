@echo off
echo.
echo [信息] 运行Web工程。
echo.

%~d0
cd %~dp0

cd ..
npm run dev

pause