rem @echo off
REM Необходимо пересохранить в кодировке win-1251

@cls

call b_sets.bat

REM Начало работы "Таймера". Установить дату и время срабатывания

set timerdate=20191005
set timertime=1100

set timenow=%TIME:~0,2%%TIME:~3,2%

if %DATE:~-4%%DATE:~3,2%%DATE:~0,2% EQU %timerdate% (
	if %timenow% GEQ %timertime% (
		set pfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%%timertime%.lsd
		set pxfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%%timertime%.xspf
		echo "TIMER"
	) ELSE (
		set pfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.lsd
		set pxfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.xspf
		echo "DAY"
	)
) ELSE (
	set pfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.lsd
	set pxfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.xspf
	echo "ANOTHERDAY"
)

REM Окончание работы "Таймера".

set npfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\n%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.lsd
set npxfile=%DATE:~-4%%DATE:~3,2%%DATE:~0,2%\n%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.xspf
set oldlog=log_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.txt
set nlist=%lists%Lists

set tlist=%srvdir%tmp
set tfile="%tlist%\play.lsd"
set ntfile="%tlist%\nplay.lsd"
set txfile="%tlist%\play.xspf"
set ntxfile="%tlist%\nplay.xspf"
set qfile="%tlist%\query.tmp"

set jlist="%lists%Lists\Job"

set plist="%lists%Lists\%pfile%"
set nplist="%lists%Lists\%npfile%"
set tcopy=/B %plist% /B %tfile% /Y
set ntcopy=/B %nplist% /B %ntfile% /Y
set jcopy=%tfile% %jlist% /D/I/F/Y
set njcopy=%ntfile% %jlist% /D/I/F/Y

set pxlist="%lists%Lists\%pxfile%"
set npxlist="%lists%Lists\%npxfile%"
set txcopy=/B %pxlist% /B %txfile% /Y
set ntxcopy=/B %npxlist% /B %ntxfile% /Y
set jxcopy=%txfile% %jlist% /D/I/F/Y
set njxcopy=%ntxfile% %jlist% /D/I/F/Y

call %lists%dolist.bat
