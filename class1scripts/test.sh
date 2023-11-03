#!/bin/bash


#echo "please provide what you want to download"

#name=$1

#echo "Beginning download of $1"

#sudo yum install python3.11 -y

#echo "Please check if $1 has been installed successfully."

tool=$1

if [ -z $tool ]; then
	read -p "Please enter tool/service you want to install: " tool
fi

dnf -y install $tool

systemctl start $tool

systemctl status $tool

