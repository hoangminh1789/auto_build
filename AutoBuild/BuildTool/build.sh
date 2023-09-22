export project_path=$(dirname $0)
export WKSPACES="/Users/minh.nguyen/wkspaces"
export UNITY_PATH="/Applications/Unity/Hub/Editor/2022.3.7f1/Unity.app"

echo $UNITY_PATH

$UNITY_PATH \
-quit \
-batchmode \
-projectPath $project_path \
-executeMethod Builder.Execute \
-buildTarget Win \
-logFile %WKSPACES\log.txt