@REM Simplified method to create admin account on windows
@echo off
:start
set /p username=Please enter a username:
set /p password=Please enter a password:
echo ---------------------------------
echo Username is now set to: %username% 
echo Password is now set to: %password%
echo ---------------------------------
echo If this is correct, press any key to continue. If not, press ctrl+c to exit now!
pause
echo.
echo Creating user account %username%
net user %username% /add %password%
echo Adding user account %username% to Administrators Group
net localgroup Administrators %username% /add
echo ---------------------------------
echo Done!
echo ---------------------------------
echo If you want to create another account, press any key to continue. If not, press ctrl+c to exit now!
pause
goto start