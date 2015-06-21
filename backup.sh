#!/bin/bash

type=

while getopts t: opt; do
	case $opt in
	t)
		type=$OPTARG
		;;
	esac
done

shift $((OPTIND -1))

if [ -z "$type" ]; then
	echo "(t)ype is required. (options: mysql, file, directory)"
	exit 1
fi