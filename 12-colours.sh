#!/bin/bash

USERID=$(id -u)
#echo -e "\e[35m HelloWorld"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
VALIDATE(){
    
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE"
        exit 1
    else
        echo -e "$2......$G SUCCESS"
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
    echo -e "MySQL is already installed...$Y INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y

    VALIDATE $? "Installing Git"
else
    echo -e "Git is already Installed....$Y INSTALLED"
fi

