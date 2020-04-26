@echo off

@echo Внимание!
@echo Обнаружен конфликтный файл:
@echo.
@echo %cfdrv%%cfdir%%cffile%%cfext%
@echo.

rem IF EXIST %cfdrv%%cfdir%%cfdir:~-9,8%%cfext% (
	rename %cfdrv%%cfdir%%cfdir:~-9,8%%cfext% %cfdir:~-9,8%%cfext%.bak
	copy /B %cfdrv%%cfdir%%cffile%%cfext% /B %cfdrv%%cfdir%%cfdir:~-9,8%.new
	rename %cfdrv%%cfdir%%cffile%%cfext% %cfdir:~-9,8%%cfext%
	echo detected and renamed >> conf.log
	echo %cfdrv%%cfdir%%cffile%%cfext% >> conf.log
	echo.  >> conf.log
	@echo.
	@echo переименован в: %cfdir:~-9,8%%cfext%
	@echo.
	@echo после проверки можно удалить файлы (не обязательно):
	@echo.
	@echo %cfdir:~-9,8%%cfext%.bak - старый файл
	@echo %cfdir:~-9,8%.new - исходный новый файл
	@echo.
	pause
	@cls
rem )
