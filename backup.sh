#!/bin/bash

# == required

# dest - destination of the backups
dest=
# type (mysql, file, directory)
type=



# == file variables
file=

function usage {
	printf """Usage:
	%s -t TYPE -dest DEST

	TYPE:
		mysql		For MySQL databases
		file		For a single file
		directory	For a directory

	DEST:
		Directory where the backups will be
""" "$0"
	exit 1
}


while getopts t:f: opt; do
	case $opt in
	t)
		type=$OPTARG
		;;
	dest)
		dest=$OPTARG
		;;
	f)
		file=$OPTARG
		;;
	esac
done

shift $((OPTIND -1))

if [ -z "$type" ] || [ -z "$dest" ]; then
	usage
fi

if [ "$type" == "file" ]; then
	if [ -z "$file" ]; then
		usage
	fi

	# check if file exists
	if [ ! -f "$file" ]; then
		echo "ERROR: $file does NOT exist"
		exit 1
	fi


fi
