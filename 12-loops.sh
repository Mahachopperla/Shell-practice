#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOG_FOLDER="/var/log/shellpractice" 
FILE_NAME=$(echo $0 | cut -d "." -f1) 
LOG_FILE="$LOG_FOLDER/$FILE_NAME.log"
PACKAGES=("mysql" "nginx" "python3" "httpd") # whatever packages we want to install write them in array
mkdir -p $LOG_FOLDER

echo "This script is getting executed at : $(date)" &>> $LOG_FILE 
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

for package in ${PACKAGES[@]}
do

    dnf list installed $package &>> $LOG_FILE 

    if [ $? -ne 0 ]  
    then
        echo -e "$Y installing $package.......$N" | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE 
        VALIDATE $? "$package"  

    else
        echo -e "$G $package is already installed... nothing to do$N" | tee -a $LOG_FILE
    fi

done




