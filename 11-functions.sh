#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    
    if [ $1 -ne 0 ]
    then
        echo "$2 .... FAILURE"
        exit 1
    else
        echo "$2......SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then    
    echo "ERROR : You must have sudo access to execute the Script"
    exit 1 #We should give other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ] #not installed
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
    
else
    echo "MySQL is already installed...INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y

    VALIDATE $? "Installing Git"
else
    echo "Git is already Installed....INSTALLED"
fi

