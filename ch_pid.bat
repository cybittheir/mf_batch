call ..\b_sets.bat

set file="%dlog%\tt.log"
set errfile="%dlog%\notr.log"
set crashlog="%dlog%\crash.log"
set pimage=LedStudio.exe
set proc="LedStudio"
set err_proc="WINDOWTITLE eq LedStudio.exe - Ошибка приложения"
set maxbytesize=1


tasklist /FI "IMAGENAME eq %pimage%" | findstr /i %proc% > %file%


FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

if %size% LSS %maxbytesize% (
	echo. %proc% > %crashlog%
	echo %DATE% >> %crashlog%
	echo %TIME% >> %crashlog%
	if EXIST %file% del %file%
) ELSE (
	if EXIST %file% del %file%
	if EXIST %crashlog% del %crashlog%
)

tasklist /V /FI %err_proc% /NH | findstr /i %proc% > %errfile%

FOR /F "usebackq" %%A IN ('%errfile%') DO set size=%%~zA

IF EXIST %errfile% (

if %size% LSS %maxbytesize% (
	del %errfile%
) 
)

IF NOT EXIST %errfile% (

tasklist /V /FI "IMAGENAME eq %pimage%" /FI "status eq NOT RESPONDING" /NH | findstr /i %proc% > %errfile%

FOR /F "usebackq" %%A IN ('%errfile%') DO set size=%%~zA

)

if %size% LSS %maxbytesize% (
	if EXIST %errfile% del %errfile%
)

IF NOT EXIST %errfile% (

tasklist /V /FI "IMAGENAME eq WerFault.exe" /NH  | findstr /i %proc% > %errfile%

FOR /F "usebackq" %%A IN ('%errfile%') DO set size=%%~zA

)

if %size% LSS %maxbytesize% (
	if EXIST %errfile% del %errfile%
)


IF EXIST %errfile% (
	echo %DATE% >> %errfile%
	echo %TIME% >> %errfile%
)