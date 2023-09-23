rem echo off
cls
ECHO [[== Load build.bat
SETLOCAL enableDelayedExpansion

CALL %~dp0config.bat
ECHO.

SET BUILD_DATE=%date:~10,4%%date:~7,2%%date:~4,2%_%time:~0,2%%time:~3,2%
SET OUTPUT_DIR=%WORKSPACE%/%BUILD_DATE%
SET LOG_PATH=%OUTPUT_DIR%/log.txt
SET OUTPUT_PATH=%OUTPUT_DIR%/AutoBuild/Test.exe

ECHO - BUILD_DATE: '%BUILD_DATE%'
ECHO - OUTPUT_DIR: '%OUTPUT_DIR%'
ECHO - PROJECT_DIR: '%PROJECT_DIR%'
ECHO - UNITY_PATH: '%UNITY_PATH%'
ECHO - LOG_PATH: '%LOG_PATH%'
:loop
if [%1]==[] goto end_loop
if [%1]==[-p] goto case_profile
if [%1]==[-v] goto case_version
shift & goto loop

:case_profile
set profileName=%2
set profilePath=%BUILD_TOOL%profiles/%profileName%.bat
shift & goto loop

:case_version
set version=%2
shift & goto loop

:end_loop

echo Profile: '%profileName%'
echo Version: '%version%'
ECHO Profile path: '%profilePath%'

if exist %profilePath% (
	CALL %profilePath% :global_config globalConfig
	ECHO Global Config: '!globalConfig!'
	ECHO.
) else (
	ECHO Load profile '%profilePath%' is failed
	EXIT 0
)

ECHO - Starting building process
ECHO.

"%UNITY_PATH%" ^
-quit ^
-batchmode ^
-projectPath "%PROJECT_DIR%" ^
-executeMethod Builder.Execute ^
-buildTarget Win32 ^
-logFile "%LOG_PATH%" ^
-outputPath "%OUTPUT_PATH%" ^
-versionCode %version% ^
%globalConfig%

ECHO.
ECHO - Finish build

CALL %BUILD_TOOL%utility.bat :validate_file
CALL %BUILD_TOOL%utility.bat :zip_file

ENDLOCAL

ECHO End of build.bat ==]]
