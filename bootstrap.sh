#!/bin/bash
while IFS= read -r line ; do
	echo "$line"
	var1=$(echo $line | cut -f1 -d:)
	var2=$(echo $line | cut -f2 -d:)
	echo $var1
	echo $var2
done <"$1"

