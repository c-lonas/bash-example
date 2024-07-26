#!/bin/bash

A_SWITCH=false
B_SWITCH=false
C_STRING=""

usage() {
cat <<EOF

Usage: bash-example.sh [-a] [-b] [-c <string>] [-h]

    -a: set A_SWITCH to true (defaults to false)
    -b: set B_SWITCH to true (defaults to false)
    -c: sets the C_STRING variable
    -h: display this help and exit

EOF
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
		echo "C_STRING is set to: ${C_STRING}"
	fi
}

second_function() {
	echo "Executing second function..."
	# Add functionality here
}

main() {
	if [[ ${A_SWITCH} == true ]]; then
		echo -n "Executing first function..."; first_function && \
		echo "Done!"; exit 0;
	fi


	if [[ ${B_SWITCH} == true ]]; then
        echo "add something"
	fi

	echo "Sample Script Finished"
}

main
