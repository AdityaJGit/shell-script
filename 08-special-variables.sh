#!/bin/bash

echo "All variables passed: $@"
echo "Number of Variables $#"
echo "Script Name: $0"
echo "Present Working Directory: $PWD"
echo "Home Directory of Current User: $HOME"
echo "Which user is running the script: $USER"
echo "Process id of current script: $$"
sleep 60 #run in foreground
sleep 60 & #run in backgroung
echo "Process id of last command in the background: $!"
