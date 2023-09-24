cd AutoBuild/BuildTool
source build.sh -p dev -v 1

#export PROJECT_PATH=$(dirname $0)/AutoBuild
#export WORKSPACE="/Users/minh.nguyen/wkspaces"
#export UNITY_PATH="/Applications/Unity/Hub/Editor/2022.3.7f1/Unity.app/Contents/MacOS/Unity"
#export OUTPUT_PATH=$WORKSPACE"/AutoBuild"
#export LOG_PATH=$WORKSPACE/log.txt
#echo $UNITY_PATH

#$UNITY_PATH \
#-quit \
#-batchmode \
#-projectPath $PROJECT_PATH \
#-executeMethod Builder.Execute \
#-buildTarget OSX \
#-logFile $LOG_PATH \
#-outputPath $OUTPUT_PATH