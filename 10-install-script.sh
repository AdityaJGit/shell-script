#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then    
    echo "ERROR : You must have sudo access to execute the Script"
    exit 1 #We should give other than 0
fi
dnf list installed mysql

if[ $? -ne 0 ] #not installed
then
    dnf install mysql -y

    if [$? ne 0]
    then
        echo "Installing Mysql .... FAILURE"
        exit 1
    else
        echo "Installing Mysql......SUCCESS"
    fi
else
    echo "MySQL is already installed...INSTALLED"
fi

dnf list installed git

if[ $? -ne 0 ]
then
    dnf install git -y

    if [$? ne 0]
    then 
        echo "Installing Git ........FAILURE"
        exit 1
    else 
        echo "Installing GIT.........SUCCESS"
    fi
else
    echo "Git is already Installed....INSTALLED"
fi

