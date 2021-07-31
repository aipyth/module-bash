#!/usr/bin/env bash
if [[ $# -lt 1 ]]; then
	>&2 echo "pattern not specified"
	exit 1
fi
IFS=' '
read -ra patterns <<< "$1"

for p in "${patterns[@]}"
do
	output=$(ls -R | grep "$p")
	if [[ $? -eq 0 ]]; then
		echo "$output"
	else 
		echo "the searched PATH is unexisting"
	fi
done
exit 0
