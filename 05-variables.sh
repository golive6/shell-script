#!/bin/bash

# when using confidential info/details, we want user to enter manually before execution (ex: login credentials)

# "read" gives a prompt ro enter a value.

echo "please enter username::"
read -s USERNAME
echo "please enter password::"
read -s PASSWORD

echo "USERNAME is:$USERNAME, PASSWORD is:$PASSWORD"