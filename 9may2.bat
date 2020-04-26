REM Начало работы "Таймера 9 мая"

set minnow=%TIME:~3,2%
set logfile=..\9may2.log
set rsub=c:\LED\Svetlan_112\2020\04. апрель\Синельник\9 мая\
set allsub=%rsub%all\

set result=%rsub%9may_sel.mp4

if %minnow% GEQ 50 (
	set sor_file=r01_2v_s16_vvsv_1056x480.mp4

	goto :endcopy
)

if %minnow% GEQ 40 (
	set sor_file=r02_2v_s16_vvsv_1056x480.mp4
	goto :endcopy
)

if %minnow% GEQ 30 (
	set sor_file=r03_2v_s16_vvsv_1056x480.mp4
	goto :endcopy
)

if %minnow% GEQ 20 (
	set sor_file=r04_2v_s16_vvsv_1056x480.mp4
	goto :endcopy
)

if %minnow% GEQ 10 (
	set sor_file=r06_2v_s16_vvsv_1056x480.mp4
	goto :endcopy
)

if %minnow% GEQ 0 (
	set sor_file=r07_2v_s16_vvsv_1056x480.mp4
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

REM Окончание работы "Таймера 9 мая".
