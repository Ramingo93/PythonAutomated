:: create dedicated application for specific OS >> PYNSTALLER IS NOT A CROSS COMPILER !!! It only generates the compiled file for the available OS

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
::______________________________________________________________________________

if exist .vEnv\ (
	call :colorEcho 0e "virtual environment already available"
) else (
	python -m virtualenv .vEnv 
	call :colorEcho 0a "virtual environment generated"
)
echo.

::manual command >> .venv\Scripts\activate
call ".vEnv\Scripts\activate.bat"
call :colorEcho 0a "virtual environment activated"
echo.
where python
echo.

py -m pip install --upgrade pip
py -m pip --version

pip install pyinstaller
echo.
pip list
echo.
pause

::pyinstaller main.py --noconsole --onefile 
pyinstaller main.py --onefile 
call :colorEcho 0a "NOTA, cercare file eseguibile nella cartella dist"
::call ".vEnv\Scripts\deactivate.bat"
pause
exit
::______________________________________________________________________________

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i