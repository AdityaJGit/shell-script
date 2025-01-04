#!/bin/bash

USERID=$(id -u)
#echo -e "\e[32m HelloWorld"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date =%Y-%m-%d-%H-%M-%S)
LOGS_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE"
        exit 1
    else
        echo -e "$2......$G SUCCESS"
    fi
}
echo "Script Started Ececuting at : $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then    
    echo "ERROR : You must have sudo access to execute the Script"
    exit 1 #We should give other than 0
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ] #not installed
then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Installing Mysql"
    
else
    echo -e "MySQL is already installed...$Y INSTALLED"
fi

dnf list installed git &>>$LOG_FILE

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE

    VALIDATE $? "Installing Git"
else
    echo -e "Git is already Installed....$Y INSTALLED"
fi

