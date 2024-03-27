:: collect versioning of required packages

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

::______________________________________________________________________________

if exist .vEnv\ (
	call :colorEcho 0a "virtual environment already available"
	echo.
	call ".vEnv\Scripts\activate.bat"
	call :colorEcho 0a "virtual environment activated "
	echo.
	call :colorEcho 0a "Generating requirements.txt "
	echo.
	py -m pip freeze > requirements.txt
	echo.
) else (
	call :colorEcho 0e "virtual environment not available"
	echo. 
)

echo.
::pause 
::exit
goto :eof

::______________________________________________________________________________

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto :eof