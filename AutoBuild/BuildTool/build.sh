
echo [[== Load build.sh

echo $(builtin cd $(dirname $0); pwd)
source config.sh

export BUILD_DATE=$(date +%y%m%d_%H%m)
export OUTPUT_DIR=$WORKSPACE/$BUILD_DATE
export LOG_PATH=$OUTPUT_DIR/log.txt
export OUTPUT_PATH=$OUTPUT_DIR/AutoBuild/Test

echo - BUILD_DATE: $BUILD_DATE
echo - OUTPUT_DIR: $OUTPUT_DIR
echo - UNITY_PATH: $UNITY_PATH
echo - PROJECT_DIR: $PROJECT_DIR
echo - LOG_PATH: $LOG_PATH

while getopts "p:v:" arg; do
	case $arg in
		p) export profileName=${OPTARG};;
		v) export version=${OPTARG};;
	esac
done


export profilePath=$BUILD_TOOL/profiles/$profileName.sh

echo - Profile: $profileName
echo - Version: $version
echo - Profile path: $profilePath

if [ ! -e $profilePath ]; then
	echo Profile not found, path: $profilePath
fi

source $profilePath

echo - Global config: ${global_config[@]}

echo
echo - Starting build
$UNITY_PATH \
-quit \
-batchmode \
-projectPath $PROJECT_DIR \
-executeMethod Builder.Execute \
-buildTarget OSX \
-logFile $LOG_PATH \
-outputPath $OUTPUT_PATH \
-versionCode $version \
${global_config[@]}

source $BUILD_TOOL/utility.sh

#validate_file
#zip_file

for process in "${post_processes[@]}"
do
	$process
done

echo End of build.sh