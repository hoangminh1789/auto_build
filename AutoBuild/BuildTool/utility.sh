echo [[== Load utility.bat

validate_file(){
	echo Running validate file
}

zip_file(){
	echo Running zip file
}

export post_processes=(
	validate_file
	zip_file
)