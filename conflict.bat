@echo off
@cls
set "cfdrv="
set "cfdir="
set "cffile="
set "cfext="

setlocal
set tdate=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%

set rdir=C:\LED
set arctfile=%rdir%\tmplist.tmp
dir %rdir% /AD /B > %arctfile%
dir %rdir%\*conflict*.lsd /S /B > %arctfile%

echo %tdate% >> conf.log

for /f ^"usebackq^ eol^=^

^ delims^=^" %%a in ("%arctfile%") do (
setlocal

set cfdrv=%%~da
set cfdir=%%~pa
set cffile=%%~na
set cfext=%%~xa
call solution.bat

)

pause
del %arctfile% /Q
