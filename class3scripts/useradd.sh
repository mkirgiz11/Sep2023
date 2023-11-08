#!/bin/bash

username=$1

useradd $username

if [ $? == '0' ]; then
    echo "User $username has been created"
elif [ $? == '9' ]; then
    echo "the user $username already exists"
else
    echo "There was a problem"
fi

