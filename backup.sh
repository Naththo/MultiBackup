#!/bin/bash

#required (mysql, file, directory)
type=

#file variables
file=

function usage {
	printf """Usage:
	%s -t TYPE

	TYPE:
		mysql		For MySQL databases
		file		For a single file
		directory	For a directory
""" "$0"
}


while getopts t:f: opt; do
	case $opt in
	t)
		type=$OPTARG
		;;
	f)
		file=$OPTARG
		;;
	esac
done

shift $((OPTIND -1))

if [ -z "$type" ]; then
	usage
fi

if [ "$type" == "file" ]; then
	if [ -z "$file" ]; then
		usage
	fi
fi
