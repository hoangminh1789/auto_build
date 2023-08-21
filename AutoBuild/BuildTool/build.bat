echo off
cls
set project_path=%cd%
echo Project path: '%project_path%'

cd AutoBuild/BuildTool
echo "Starting build"
echo Current path: '%cd%'

call config.bat

echo Unity path: '%UNITY_PATH%'

:loop
if [%1]==[] goto end_loop
if [%1]==[-p] goto case_profile
if [%1]==[-v] goto case_version
shift & goto loop

:case_profile
set profile_name=%2
set profile_path=profiles/%profile_name%.bat
shift & goto loop

:case_version
set version=%2
shift & goto loop

:end_loop

echo Profile: %profile_name%
echo Version: %version%

echo Load profile '%profile_path%'
if exist %profile_path% (
	call %profile_path%
	echo Load profile '%profile_path%' is succeed
) else (
	echo Load profile '%profile_path%' is failed
	exit 0
)

%UNITY_PATH% \
		-quit \
		-batchmode \
		-projectPath %project_path%
		-buildTarget Win

echo "Finish build"