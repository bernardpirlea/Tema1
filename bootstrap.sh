#!/bin/bash
{
while IFS= read -r line ; do
	var1=$(echo $line | cut -f1 -d:)
	var2=$(echo $line | cut -f2 -d:)
	if [[ $var1 == *"update"*  ]] && [[ $var2 == *"yes"* ]]; then
		yum -y update
	fi
	if [[ $var1 == *"sshkey"* ]]; then
		mkdir -p ~/.ssh
		echo $var2 >> ~/.ssh/authorized_keys
		chmod -R go= ~/.ssh
		sed -i "s/^PasswordAuthentication.*/PasswordAuthentication no/" /etc/ssh/sshd_config
		systemctl restart sshd.service
	fi
done <"$1"
} &> /var/log/system-bootstrap.log
