echo [[== Load config.sh
export BUILD_TOOL=$(builtin cd $(dirname $0); pwd)
export PROJECT_DIR=$(builtin cd $BUILD_TOOL/..; pwd)
export UNITY_PATH="/Applications/Unity/Hub/Editor/2022.3.7f1/Unity.app/Contents/MacOS/Unity"
export WORKSPACE="/Users/minh.nguyen/wkspaces"

echo Variables in config.sh
echo BUILD_TOOL: "$BUILD_TOOL"
echo UNITY_PATH: "$UNITY_PATH"
echo PROJECT_DIR: "$PROJECT_DIR"
echo WORKSPACE: "$WORKSPACE"