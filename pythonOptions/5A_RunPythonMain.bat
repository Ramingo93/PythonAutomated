:: run your python code

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

::______________________________________________________________________________
::set "main=main.py"
set "main=1_template.py"
if exist %main% (
	python "%main%" ::to be added (**args, **kwargs)
	pause
	exit
) else (
	call :colorEcho 0e "no MAIN.PY file available"
	echo. 
	pause 
	exit
)

::______________________________________________________________________________
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto :eof