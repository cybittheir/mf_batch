@echo off

@echo ��������!
@echo �����㦥� ���䫨��� 䠩�:
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
	@echo ��२������� �: %cfdir:~-9,8%%cfext%
	@echo.
	@echo ��᫥ �஢�ન ����� 㤠���� 䠩�� (�� ��易⥫쭮):
	@echo.
	@echo %cfdir:~-9,8%%cfext%.bak - ���� 䠩�
	@echo %cfdir:~-9,8%.new - ��室�� ���� 䠩�
	@echo.
	pause
	@cls
rem )
