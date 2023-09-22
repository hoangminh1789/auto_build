echo off
CALL AutoBuild/BuildTool/build.bat -p=dev -v=1


:: Import
REM AutoBuild/BuildTool/config.bat


REM SET WORKSPACE=C:\wkspaces
REM SET UNITY_PATH="C:\Program Files\Unity\Hub\Editor\2022.3.7f1\Editor\Unity.exe"
REM SET PROJECT_PATH=C:\Users\Minh\Projects\auto_build\AutoBuild
REM SET OUTPUT_PATH="%WORKSPACE%/AutoBuild/Test.exe"
REM SET LOG_PATH=%WORKSPACE%/log.txt


REM %UNITY_PATH% ^
REM -quit ^
REM -batchmode ^
REM -projectPath "%PROJECT_PATH%" ^
REM -executeMethod Builder.Execute ^
REM -buildTarget Win32 ^
REM -logFile %LOG_PATH% ^
REM -outputPath %OUTPUT_PATH%
