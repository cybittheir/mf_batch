@echo on

set /a job_month=%DATE:~3,2%
set /a job_year=%DATE:~-4%
set /a last_year=%DATE:~-4% - 1

set old_path=%CD%

cd %lists%

if EXIST "arch.tmp" (del "arch.tmp" /Y)

if NOT EXIST %lists%Lists\%job_year% (
	md %lists%Lists\%job_year%
)

if %job_month% EQU 12 (
	dir %lists%Lists\%job_year%10* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 11 (
	dir %lists%Lists\%job_year%09* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 10 (
	dir %lists%Lists\%job_year%08* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 9 (
	dir %lists%Lists\%job_year%07* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 8 (
	dir %lists%Lists\%job_year%06* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 7 (
	dir %lists%Lists\%job_year%05* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 6 (
	dir %lists%Lists\%job_year%04* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 5 (
	dir %lists%Lists\%job_year%03* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 4 (
	dir %lists%Lists\%job_year%02* /b > arch.tmp
	goto :do_move
)

if %job_month% EQU 3 (
	dir %lists%Lists\%job_year%01* /b > arch.tmp
	goto :do_move
)

if %job_month% LEQ 2 (
	dir %lists%Lists\%last_year%12* /b > arch.tmp
	goto :do_move
)

if %job_month% LEQ 1 (
	dir %lists%Lists\%last_year%11* /b > arch.tmp
	goto :do_move
)

goto :end

:do_move

for /f ^"usebackq^ eol^=^
 delims^=^" %%a in ("arch.tmp") do (
	if EXIST %lists%Lists\%%a (
	xcopy %lists%Lists\%%a %lists%Lists\%job_year%\%%a\ /Y
	if EXIST %lists%Lists\%job_year%\%%a (rmdir %lists%Lists\%%a /S /Q)
	)
)

:end

cd %old_path%