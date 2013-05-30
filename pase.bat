@echo off
:Menu
cls
echo Seleccione su opcion tecleando el numero respectivo.
echo.
echo 1. Pase a produccion
echo 2. Restaurar ultimo pase
echo 3. Salir
set /p var=
if %var%==1 goto :send_prod
if %var%==2 goto :restore_last
if %var%==3 goto exit
if %var% GTR 3 echo Error
goto :Menu
:send_prod
cls 
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set year=%date:~-4%
set month=%date:~3,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
set datetimef=%year%%month%%day%_%hour%%min%%secs%
MD "bcks\%datetimef%"
set "default_path=C:\Users\dmachacac\Desktop\toprod\bcks\%datetimef%"

set "origen=D:\pylons\prod\sap"
set "destino=\\10.252.194.130\sap\prueba"
:: Creando un back-up de Produccion
for /f "delims=" %%x in (to_upload.txt) do  xcopy "%destino%%%x" "%default_path%%%x" /ITY  
for /f "delims=" %%x in (to_upload.txt) do  xcopy "%destino%%%x" "%default_path%%%x"  /S /Y 

:: Creando carpetas y copiando archivos
for /f "delims=" %%x in (to_upload.txt) do  xcopy "%origen%%%x" "%destino%%%x" /T /Y  
for /f "delims=" %%x in (to_upload.txt) do  xcopy "%origen%%%x" "%destino%%%x"  /S /Y 

pause>nul
goto :Menu

:restore_last
echo 'En desarrollo'
cls
pause>nul
goto :Menu