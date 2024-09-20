#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
       echo "please run this script with root permission"
    exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ...$R failed$N"
        exit 1

    else
        echo -e "$2 is .. $G success$N"
    fi
} 

CHECK_ROOT

dnf list installed git 
if [ $? -ne 0 ]
then 
    echo "git is not installed, goint to install"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "$G Git is already installed, nothing to do $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not insatlled, going to install"
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo -e "$G mysql is already installed, nothing to do $N"
fi