#!/bin/bash

#function_name () {
#  commands
#}

#function_name () { commands; }

filename=$1
content=$2

function cert_writer {
  touch  /var/www/html/certificates/$1
  echo "$2" > /var/www/html/certificates/$1
}


if [ $# -lt 2 ]; then
    echo "Usage $0 <cert filename> <file content>"
    exit 1
fi

cert_writer
