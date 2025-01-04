#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then    
    echo "ERROR : You must have sudo access to execute the Script"
    exit 1 #We should give other than 0
fi

dnf install mysqll -y

if [$? ne 0]
then
    echo "Installing Mysql .... FAILURE"
    exit 1
else
    echo "Installing Mysql......SUCCESS"
fi

dnf install git -y

if [$? ne 0]
then 
    echo "Installing Git ........FAILURE"
    exit 1
else 
    echo "Installing GIT.........SUCCESS"
fi