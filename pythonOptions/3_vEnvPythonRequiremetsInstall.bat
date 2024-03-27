:: install required packages

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

::______________________________________________________________________________

@echo off
if exist requirements.txt ( 
	call :colorEcho 0a "file requirements.txt available" 
	echo.
) else (
	call :colorEcho 0e "requirements.txt file NOT available" 
	echo.
	::pause 
	::exit
	goto :eof
)

if exist .vEnv\ (
	call :colorEcho 0a "virtual environment available" 
	echo.
) else (
	call :colorEcho 0e "virtual environment NOT available" 
	echo.
	::pause 
	:::exit
	goto :eof
)

call ".vEnv\Scripts\activate.bat"
py -m pip install -r requirements.txt
call :colorEcho 0a "packages installed" 
echo.
::exit
goto :eof

::______________________________________________________________________________

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto :eof