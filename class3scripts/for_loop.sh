#!/bin/bash

for var in $(cat users.txt); do 
    ## run some commands per argument
    #useradd $var
    #userdel $var
    #if [ $var == check.sh ]; then
    #    chmod +x $var
    #fi
    echo $var
done
