REM by Aleksandr Lovin aka cybittheir
REM 2020

call ..\b_sets.bat

set wlog=%srvdir%warn
set restfile=%wlog%\restarted.log

IF NOT EXIST %wlog% MD %wlog%
	
@echo. > %restfile%
date /T >> %restfile%
time /T >> %restfile%

