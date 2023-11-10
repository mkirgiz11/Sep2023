#!/bin/bash

# if [ $# -le 0 ]; then
#     echo "Usage: $0 <filepath>"
#     exit 1
# fi

# filepath=$1

## FOR NEW WEBSITES
# for web in $(cat websites.txt); do
#     name=$(echo $web | awk -F "/" '{ print $9 }' | awk -F "." '{ print $1 }')
#     wget $web -P /tmp/
#     unzip /tmp/$name.zip -d /var/www/html/
#     rm -rf /tmp/$name.zip
#     mkdir /var/www/html/$name
#     mv /var/www/html/*$name*/* /var/www/html/$name/
# done

## FOR ADDING WEBSITES
for web in $(cat websites.txt); do
    name=$(echo $web | awk -F "/" '{ print $9 }' | awk -F "." '{ print $1 }')

if [ -d "/var/www/html/$name" ]; then
        echo "Website $name already exists. Skipping download boss."
    else
        wget $web -P /tmp/
        unzip /tmp/$name.zip -d /var/www/html/
        rm -rf /tmp/$name.zip
        mkdir /var/www/html/$name
        mv /var/www/html/*$name*/* /var/www/html/$name/
        echo "You Downloaded a new website $name. Check it out!"
    fi
done

