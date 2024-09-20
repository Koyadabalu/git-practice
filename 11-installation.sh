#!/bin/bash

USERID=$(id -u)
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo "please run this script with root privileges"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
  then
      echo "git is not installed , going to install it"
      dnf install git -y
      if [ $? -ne 0 ]
      then 
          echo "git installation is not success ... check it"
          exit 1
      else
          echo "git installation is success"
      fi
 
else
    echo -e  " git is  already installed, $G nothing to do $N"

fi

dnf list installed mysql
if [ $? -ne 0 ]
  then 
      echo "mysql is not installed , going to install it"
      dnf install mysql -y
      if [ $? -ne 0 ]
      then 
          echo "mysql is not success ... check it"
          exit 1
      else
          echo -e "mysql installation is $G success $N"
      fi
else  
    echo -e "mysql is already installed, $G nothing to do $N"

fi