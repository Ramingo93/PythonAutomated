:: create virtual environment Windows OS

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
::______________________________________________________________________________

if exist .vEnv\ (
	call :colorEcho 0e "virtual environment already available"
	echo.
	rd /s /q ".vEnv"
	call :colorEcho 0e "virtual environment deleted"
	echo.
)
python -m virtualenv .vEnv 
::pause
::attrib +h ".vEnv"
call :colorEcho 0a "virtual environment generated"
echo.
::pause 

::manual command >> .venv\Scripts\activate
call ".vEnv\Scripts\activate.bat"
call :colorEcho 0a "virtual environment activated"
echo.
echo python available at paths
where python
echo.
::pause

py -m pip install --upgrade pip
py -m pip --version
::pause
call :colorEcho 0a "pip installed in virtual environment"
echo.
::pause
::call ".vEnv\Scripts\deactivate.bat"
::exit
goto :eof

::______________________________________________________________________________
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto :eof