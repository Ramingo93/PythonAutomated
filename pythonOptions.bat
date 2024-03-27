:: create a template main.py 

@echo off
::https://stackoverflow.com/questions/21660249/how-do-i-make-one-particular-line-of-a-batch-file-a-different-color-then-the-oth
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
::______________________________________________________________________________

:menu
echo Select an option:
echo [1] setup new main.py, and decorators.py files
echo [2] setup virtual environment
echo [3] install requirements.txt file
echo [4] generate requirements.txt file
echo.
set /p scelta="Choose option: "
if "%scelta%"=="1" goto opzione1
if "%scelta%"=="2" goto opzione2
if "%scelta%"=="3" goto opzione3
if "%scelta%"=="4" goto opzione4
echo Option not available
echo.

:continue
set /p scelta="Continue? [Y or y to continue execution]: "
cls
if "%scelta%"=="Y" goto menu
if "%scelta%"=="y" goto menu
::pause
exit

::______________________________________________________________________________
:opzione1
rem call :funzione1
set "sourceA=pythonOptions\main.py"
set "destinationA=main.py"
set "sourceB=pythonOptions\decorators.py"
set "destinationB=decorators.py"
set "overwriteCheck=ok"
if exist "%destinationA%" set "overwriteCheck=nok"
if exist "%destinationB%" set "overwriteCheck=nok"
if "%overwriteCheck%"=="nok" (
	call :colorEcho 0e "main file or decorator file already present. No further processing."
	echo.
) else (
	cd "pythonOptions\"
	call "1_projPythonTemplateSetup.bat"
	cd ..
	move "%sourceA%" "%destinationA%"
	move "%sourceB%" "%destinationB%"
)
goto continue

:opzione2
rem call :funzione2
move "pythonOptions\2_vEnvPythonSetup.bat" "2_vEnvPythonSetup.bat"
call "2_vEnvPythonSetup.bat"
move "2_vEnvPythonSetup.bat" "pythonOptions\2_vEnvPythonSetup.bat"
set /p scelta="Install requirements? [Y or y to install]: "
if "%scelta%"=="Y" goto opzione3
if "%scelta%"=="y" goto opzione3
goto continue

:opzione3
rem call :funzione3
::attrib -h ".vEnv"
move "pythonOptions\3_vEnvPythonRequiremetsInstall.bat" "3_vEnvPythonRequiremetsInstall.bat"
call "3_vEnvPythonRequiremetsInstall.bat"
move "3_vEnvPythonRequiremetsInstall.bat" "pythonOptions\3_vEnvPythonRequiremetsInstall.bat"
::attrib +h ".vEnv"
goto continue

:opzione4
rem call :funzione4
::attrib -h ".vEnv"
move "pythonOptions\4_vEnvPythonRequirementsFreeze.bat" "4_vEnvPythonRequirementsFreeze.bat"
call "4_vEnvPythonRequirementsFreeze.bat"
move "4_vEnvPythonRequirementsFreeze.bat" "pythonOptions\4_vEnvPythonRequirementsFreeze.bat"
::attrib +h ".vEnv"
goto continue

::______________________________________________________________________________
:funzione1
echo.
goto :continue
:funzione2
echo Option 2 selected
echo.
goto :continue
:funzione3
echo Option 3 selected
echo.
goto :continue
:funzione4
echo Option 4 selected
echo.
goto :continue

::______________________________________________________________________________
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
goto :eof