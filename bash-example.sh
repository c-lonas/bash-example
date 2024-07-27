#!/bin/bash

A_SWITCH=false
B_SWITCH=false
C_STRING=""

log_file="/var/log/bash_example_script.log"

usage() {
cat <<EOF

Usage: bash-example.sh [-a] [-b] [-c <string>] [-h]

    -a: set A_SWITCH to true (defaults to false)
    -b: set B_SWITCH to true (defaults to false)
    -c: sets the C_STRING variable
    -h: display this help and exit

EOF
}

log() {
	echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a $log_file
}

while getopts "abc:h" opt; do
	case $opt in
		a)
			A_SWITCH=true
			;;
		b)
			B_SWITCH=true
			;;
		c)
			C_STRING=${OPTARG}
			;;
		h)
			usage
			exit 0
			;;
		\?)
			usage
			exit 1
			;;
	esac
done

first_function() {
	if ! [[ -z ${C_STRING} ]]; then
		echo "Hello, world!"
	else
		echo "C_STRING has been set!"
		echo "Hello, ${C_STRING}!"
	fi
}

second_function() {
	sleep 3
}

main() {

	log "Bash example script started"
	if [[ ${A_SWITCH} == true ]]; then
		log "A_SWITCH is true, executing first function"
		echo -n "Executing first function..."; first_function && \
		echo "Done!"; exit 0;
	fi


	if [[ ${B_SWITCH} == true ]]; then
		log "B_SWITCH is true, executing second function..."
        echo -n "Executing second function..."; second_function && \
		echo "Done!"; exit 0;
	fi

	echo "Sample Script Finished"
}

main
