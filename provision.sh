#!/bin/bash

# assign variables
ACTION=${1}
version="1.0.0"


function remove_nginx () {

sudo service nginx stop
sudo rm /usr/share/nginx/html/*
sudo yum remove nginx -y


}

function show_version() {

echo $version
}


function display_help() {

cat << EOF
Usage: ${0} {-h|--help|-r|--remove|-v|--version}

OPTIONS:
		
		-r | --remove   Removes Nginx
		-v | --version  Displays the Version
		-h | --help		Display the command help

Examples:
		Remove Nginx:
				$ ${0} -r
		Displays the version:
				$ ${0} -v
		Display help:
				$ ${0} -h

EOF
}

case "$ACTION" in
                -h|--help)
				display_help
				;;
		-r|--remove)
				remove_nginx
				;;
		-v|--version)
				show_version
				;;
		*)
		sudo yum update -y
		sudo amazon-linux-extras install nginx1.12 -y
		sudo chkconfig nginx on
		sudo aws s3 cp s3://sravani-beegala-assignment-3/index.html /usr/share/nginx/html/index.html
		sudo service nginx start
		
		exit 1
esac
