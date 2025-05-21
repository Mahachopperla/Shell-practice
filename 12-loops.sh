#!/bin/bash

# in last scripts we just tried to install nginx and mysql.
#what if we want to install more packages let it be 10 + packages
# fucntions can help to some extent to prevent repetition of code
#but we need to call functions explicitly to get the work done
# if we want a task to be performed n no.of times automatically until a specific condition is met
# here comes the use of loops concept
# let's try to include for loop in our code and decrease lines of code and improves efficiency of code

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

# we have written for loop which takes input automatically form packages array
#for each package in array installation steps will be executed
#like wise u can install as many as packages you need

#if you dont want to make any changes to code and u just want to pass args dynamically
#during script execution then u can use

# for package in $@

# $@ wil take input args as individual items and give them as input to for loops

# u can execute as

# sh loops.sh mysql python3 nginx httpd



