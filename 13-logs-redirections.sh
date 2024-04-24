#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){     #function is checking if the installation is SUCCESS or FAILURE.
if [ $1 -ne 0 ]
then 
    echo "$2....FAILURE"
    exit 1
else
    echo "$2....SUCCESS"
fi

}

if [ $USERID -ne 0 ] #checking if the USERID is 0 or not, if 0 it is a SUPER-USER, will have access for installation and exit status is 0
then
    echo "please run this script with root access."
    exit 1 #manually exit if there is a error.
else
    echo "You are a Super User"
fi


dnf install mysql -y &>>$LOGFILE #checking if the previous command exit status is 0 or not and if 0 then installation will proceed
VALIDATE $? "Installing MySQL" 

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"