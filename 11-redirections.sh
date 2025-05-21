#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# in this script we are going to include redirections
# use case1: if we are directly printing entire output to terminal it would be messy 
# usecase 2: and also if we want to see the output(execution) status after certain period of time 
# it wont be there. so to preserve the execution logs we will redirect output to log file 

LOG_FOLDER="/var/log/shellpractice" # a folder to store log files
FILE_NAME=$(echo $0 | cut -d "." -f1) 
# $0 will give output-> script name as redirections.sh. it will be passed as input to cut
#and cut separates script name with dot and takes first word (-f1) and assignes it to SCRIPT_NAME variable

LOG_FILE="$LOG_FOLDER/$FILE_NAME.log"

USERID=$(id -u)  

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:$N $Y please run command with root access to execute succesfully$N " | tee -a $LOG_FILE
    exit 1
fi


VALIDATE(){
    if [ $1 -eq 0 ]
        then
            echo -e " $G installation of $2 is successfull $N" | tee -a $LOG_FILE
        else
            echo -e " $R installation of $2 is failed $N" | tee -a $LOG_FILE
            exit 1
    fi
}



dnf list installed mysql &>> $LOG_FILE 

if [ $? -ne 0 ]  
then
    echo -e "$Y installing MYSQL.......$N" | tee -a $LOG_FILE
    dnf install mysql -y &>> $LOG_FILE 
    VALIDATE $? "mysql"  

else
    echo -e "$G mysql is already installed... nothing to do$N" | tee -a $LOG_FILE
fi



dnf list installed nginx

if [ $? -ne 0 ]  
then
    echo -e "$Y installing NGINX.......$N" | tee -a $LOG_FILE
    dnf install nginx -y
    VALIDATE $? "nginx"  
    
else
    echo -e "$G Nginx is already installed... nothing to do$N" | tee -a $LOG_FILE
fi



# types of redirections:

# 1>filename or >filename ---- redirects success outputs
# 2>filename ---- redirects error outputs
# &>filename ---- redirects both success and error outputs
# >filename --- overwrites existing content of file 
# >>filename --- appends new content to existing file
# tee -a filename --- appends output to file and wont redirect

# difference between redirection and tee cmnd

# if we use redirection output redirected to specified file . it wont be printed to screen
# if we use tee cmnd output will be printed to screen and also appended to otput file
