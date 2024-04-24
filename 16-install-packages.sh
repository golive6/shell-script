#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "scripting started executing at: $TIMESTAMP"

VALIDATE(){     #function is checking if the installation is SUCCESS or FAILURE.
if [ $1 -ne 0 ]
then 
    echo -e "$2....$R FAILURE $N"
    exit 1
else
    echo -e "$2....$G SUCCESS $N"
fi

}

if [ $USERID -ne 0 ] #checking if the USERID is 0 or not, if 0 it is a SUPER-USER, will have access for installation and exit status is 0
then
    echo "please run this script with root access."
    exit 1 #manually exit if there is a error.
else
    echo "You are a Super User"
fi


for i in $@  
do
  echo "package to install: $i"  
  dnf list installed $i &>>$LOGFILE #checking if the package is installed or not.
  if [ $? -eq 0 ]
  then 
      echo -e "$i package is already installed.....$Y SKIPPING $N" #if given package is already installed skipping installation.
   else
       dnf install $i -y &>>$LOGFILE #if given package is not installed, now that package will get installed.
       VALIDATE $? "Installation of $i"
   fi
done