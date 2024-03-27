:: create a template main.py 

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

::______________________________________________________________________________

if exist main.py (
	call :colorEcho 0e "a MAIN.PY file is already available"
	echo.
) else (
	call :colorEcho 0a "generating a new MAIN.PY template"
	echo. 
	type 1_template.py > main.py
	type 1_decorators.py > decorators.py
)
echo.
::pause
goto :eof
::exit /B

::______________________________________________________________________________
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto :EOF
