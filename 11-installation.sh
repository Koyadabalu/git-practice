#!/bin/bash

USERID=$(id -u)

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
    echo "git is already installed, nothing to do"

fi
