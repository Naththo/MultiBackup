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
	%s -t TYPE -d DEST

	TYPE:
		mysql		For MySQL databases
		file		For a single file
		directory	For a directory

	DEST:
		Directory where the backups will be
""" "$0"
	exit 1
}


while getopts t:f:d: opt; do
	case $opt in
	t)
		type=$OPTARG
		;;
	d)
		dest=$OPTARG
		;;
	f)
		file=$OPTARG
		;;
	esac
done

shift $((OPTIND -1))

if [ -z "$type" ]; then
	echo "$type"
	usage
fi

if [ -z "$dest" ]; then
	echo "no?"
fi

if [ ! -d "$dest" ]; then
	printf "\"%s\" does not exist.\nWould you like to create it now? (Y/N) [ENTER]: " "$dest"
	read input
	case "$input" in
		y|Y )
		;;
		n|N ) printf "Please create the directory or change the directory with the -dest switch\nExiting...\n"
			exit 1
		;;
		* ) printf "Invalid option.\nPlease create the directory or change the directory with the -dest switch\nExiting...\n"
			exit 1
		;;
	esac

	mkdir "$dest"
	if [ $? -ne 0 ]; then
		echo "Could not create directory."
		exit 1
	fi
	echo "Directory created."
fi

if [ ! -w "$dest" ]; then
	echo "Cannot write to directory. Please check the permissions."
	exit 1
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
