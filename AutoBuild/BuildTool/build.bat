rem echo off
cls
ECHO [[== Load build.bat
SETLOCAL enableDelayedExpansion

CALL %~dp0config.bat


SET LOG_PATH=%WORKSPACE%/log.txt
SET OUTPUT_PATH=%WORKSPACE%/AutoBuild/Test.exe

ECHO PROJECT_PATH: '%PROJECT_PATH%'
ECHO Unity path: '%UNITY_PATH%'

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
	CALL %profilePath% :global_config config
	ECHO Config: '!config!'
) else (
	ECHO Load profile '%profilePath%' is failed
	EXIT 0
)

ECHO - Starting building process

"%UNITY_PATH%" ^
-quit ^
-batchmode ^
-projectPath "%PROJECT_PATH%" ^
-executeMethod Builder.Execute ^
-buildTarget Win32 ^
-logFile "%LOG_PATH%" ^
-outputPath "%OUTPUT_PATH%" ^
-versionCode %version% ^
%config%

ECHO - Finish build

CALL %BUILD_TOOL%utility.bat :validate_file
CALL %BUILD_TOOL%utility.bat :zip_file

ENDLOCAL

ECHO End of build.bat ==]]
