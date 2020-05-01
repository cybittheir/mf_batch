REM begining of timer check
REM by Aleksandr Lovin aka cybittheir
REM 2020

set minnow=%TIME:~3,2%
set logfile=..\[filename.log]
set rsub=c:\[folder_path]
set allsub=%rsub%all\

set result=%rsub%[result_file_name]

IF NOT EXIST %logfile% (
	echo. > %logfile%
)

if %minnow% GEQ 50 (
	set sor_file=[filename_6]

	goto :endcopy
)

if %minnow% GEQ 40 (
	set sor_file=[filename_5]
	goto :endcopy
)

if %minnow% GEQ 30 (
	set sor_file=[filename_4]
	goto :endcopy
)

if %minnow% GEQ 20 (
	set sor_file=[filename_3]
	goto :endcopy
)

if %minnow% GEQ 10 (
	set sor_file=[filename_2]
	goto :endcopy
)

if %minnow% GEQ 0 (
	set sor_file=[filename_1]
	goto :endcopy
)

:endcopy

FOR /F "usebackq" %%A IN ('%logfile%') DO set size=%%~zA

if %size% GEQ 4000 (
	del %logfile%
)

	@echo. >> %logfile%
	date /T >> %logfile%
	time /T >> %logfile%
	dir /b "%allsub%%sor_file%" >> %logfile%
	copy /B "%allsub%%sor_file%" /B "%result%" /Y >> %logfile%


:oef

REM Finish
