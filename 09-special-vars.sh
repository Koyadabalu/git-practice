#!/bin/bash

echo "All the variables passed to the script : $@ "
echo "Number of variables passed : $# "
echo "script name : $0 "
echo "current working directory : $PWD "
echo "Home directory of current user : $HOME "
echo "PID of the script executing now : $$ "

sleep 100 &
echo "pid of last background command : $! "
echo "pid of last background command : $! "