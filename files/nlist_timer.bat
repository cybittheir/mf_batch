REM Начало работы "Таймера". Установить дату и время срабатывания

set timerdate=20181214
set timertime=2200

set timenow=%TIME:~0,2%%TIME:~3,2%

if %DATE:~-4%%DATE:~3,2%%DATE:~0,2% EQU %timerdate% (
	if %timenow% GEQ %timertime% (
		set pfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%%timertime%.lsd
		echo "TIMER"
	) ELSE (
		set pfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.lsd
		echo "DAY"
	)
) ELSE (
	set pfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.lsd
	echo "ANOTHERDAY"
)

REM Окончание работы "Таймера".
