#!/bin/bash

USERID=$(id -u) #checking if the userid is root/super user or not.

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with roor access."
    exit 1 #manually exit if there is a error
else
    echo "You are a SUPER USER."
fi


dnf install mysqll -y

if  [ $? -ne 0 ] 
then 
    echo "Installation of mysql....FAILURE"
    exit 1
else
    echo "Installation of mysql....SUCCESS"
fi


dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installation of git....FAILURE"
    exit 1
else
    echo "Installation of git....SUCCESS"
fi