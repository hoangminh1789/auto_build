echo [[== Load dev.sh

export define_symbols=(
	-scriptingDefineSymbols 'BUILD_DEV,ENABLE_LOG'
)

export namespace=(
	-namespace 'com.minhnh.autobuild'
)

export global_config=(
	${define_symbols[@]}
	${namespace[@]}
)

