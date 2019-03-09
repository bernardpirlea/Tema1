#!/bin/bash
while IFS= read -r line ; do
	var1=$(echo $line | cut -f1 -d:)
	var2=$(echo $line | cut -f2 -d:)
	if [[ $var1 == *"update"*  ]] && [[ $var2 == *"yes"* ]]; then
		yum -y update
	fi
done <"$1"

