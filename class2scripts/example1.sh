#!/bin/bash

read -p "What is your age? " age

if [ "$age" -lt 12 ]; then
    echo "Hello, future programmer"
elif [ "$age" -ge 12 ] && [ "$age" -lt 30 ]; then
    echo "Hello, junior programmer"
elif [ "$age" -ge 30 ] && [ "$age" -lt 65 ]; then
    echo "Hello, Senior programmer"
else
    echo "Hello, ancient programmer"
fi