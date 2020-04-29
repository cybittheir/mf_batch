REM Начало работы "Таймера Социалки"

set minnow=%TIME:~3,2%
set logfile=..\constt.log
set allsub=C:\LED\Svetlan_112\2020\03. март\Синельник\Социалка\
set selsub=%allsub%sel\

set result=%selsub%08_const_sel.avi

if %minnow% GEQ 57 (
	set sor_file=08_giv_10sek_h264_xvid.avi

	goto :endcopy
)

if %minnow% GEQ 53 (
	set sor_file=08_gragd_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 44 (
	set sor_file=08_med_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 40 (
	set sor_file=08_pens_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 36 (
	set sor_file=08_priroda_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 31 (
	set sor_file=08_pushkin_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 27 (
	set sor_file=08_semya_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 23 (
	set sor_file=08_stab_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 18 (
	set sor_file=08_trud_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 14 (
	set sor_file=08_volonter_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 9(
	set sor_file=08_war_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 4 (
	set sor_file=08_zemly_10sek_h264_xvid.avi
	goto :endcopy
)

if %minnow% GEQ 0 (
	set sor_file=08_ziv1_10sek_h264_xvid.avi
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

REM Окончание работы "Таймера Социалки".
