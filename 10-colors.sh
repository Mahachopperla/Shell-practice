#!/bin/bash

#to improve readability- instead of using entire syntax of color code, we are declaring them as variables
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" # this will change color back to normal (to end color code)

USERID=$(id -u)  # id -u gives userid of current user, root user id will be 0 always

if [ $USERID -ne 0 ]
then
    # -e enables color code
    echo -e "$R ERROR:$N $Y please run command with root access to execute succesfully$N "
    exit 1
fi

# step2: let's write a function to validate installation is success or not
VALIDATE(){
    if [ $1 -eq 0 ]
        then
            echo -e " $G installation of $2 is successfull $N"
        else
            echo -e " $R installation of $2 is failed $N" 
            exit 1
    fi
}

#so whenver we install any package , to validate no need to write code again we can simply call validate function

dnf list installed mysql

if [ $? -ne 0 ]  # $? returns 0 if mysql is already there otherwise it is someother num er not 0
then
    echo -e "$Y installing MYSQL.......$N"
    dnf install mysql -y
    VALIDATE $? "mysql"  # we are passing args to function here $1 will be $?(exit status) and $2 will be package name

else
    echo -e "$G mysql is already installed... nothing to do$N"
fi

#installing nginx

dnf list installed nginx

if [ $? -ne 0 ]  # $? returns 0 if mysql is already there otherwise it is someother num er not 0
then
    echo -e "$Y installing NGINX.......$N"
    dnf install nginx -y
    VALIDATE $? "nginx"  # we are passing 2 args to function ,here $1 will be $?(exit status) and $2 will be package name
    
else
    echo -e "$G Nginx is already installed... nothing to do$N"
fi
