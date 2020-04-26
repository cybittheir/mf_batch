rem @echo off

if NOT EXIST %srvdir% (
	MD %srvdir%
	MD %dlog%
	MD %tlist%
) ELSE (
	if NOT EXIST %dlog% MD %dlog%
	if NOT EXIST %tlist% MD %tlist%
)

FOR /F "usebackq" %%A IN ('%qfile%') DO set size=%%~zA

if %size% GEQ 100 (
	del %qfile%
)

if EXIST %plist% (
	@echo on
	echo.
	echo File %plist% exist
	del %nlist%\Job\play.lsd /Q

	@echo. >> %logfile%
	date /T >> %logfile%
	time /T >> %logfile%

	copy %tcopy% >> %logfile%
	copy %txcopy% >> %logfile%

	if NOT EXIST %jlist% MD %jlist%

	xcopy %jcopy% >> %logfile%
	xcopy %jxcopy% >> %logfile%

	if NOT EXIST %dlog%\%oldlog% RENAME %logfile% %oldlog%

)
if EXIST %nplist% (
	@echo on
	echo.
	echo File %nplist% exist
	del %nlist%\Job\nplay.lsd /Q
	if NOT EXIST %dlog% MD %dlog%
	@echo. >> %logfile%
	date /T >> %logfile%
	time /T >> %logfile%
	if NOT EXIST %tlist% MD %tlist%
	copy %ntcopy% >> %logfile%
	copy %ntxcopy% >> %logfile%
	if NOT EXIST %jlist% MD %jlist%
	xcopy %njcopy% >> %logfile%
	xcopy %njxcopy% >> %logfile%
	if NOT EXIST %dlog%\%oldlog% RENAME %logfile% %oldlog%
)

IF %TIME:~3,2% GEQ 57 (
	del %qfile%
)

IF NOT EXIST %qfile% (
	echo "TIME only" > %qfile%
)

TIME /T >> %qfile%

if EXIST %timer_file% (
	copy %timer_file% "%lists%" /Y
)

IF %DATE:~0,2% EQU 10 (
	IF %TIME:~0,2%%TIME:~3,2% GTR 1520 (
		IF %TIME:~0,2%%TIME:~3,2% LSS 1530 (call %lists%archive.bat)
	)
)

rem call %lists%ch_pid.bat