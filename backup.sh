#!/bin/bash

type=


function usage {
	printf """Usage:
	%s -t TYPE

	TYPE:
		mysql		For MySQL databases
		file		For a single file
		directory	For a directory
""" "$0"
}


while getopts t: opt; do
	case $opt in
	t)
		type=$OPTARG
		;;
	esac
done

shift $((OPTIND -1))

if [ -z "$type" ]; then
	usage
fi