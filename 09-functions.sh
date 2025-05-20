#!/bin/bash

#if we want to install multiple packages we have to repeat code that many times
# to avoid unwanted repeatation of code we included functions
# functions will take input , perform task and returns output

#let's install 3 packages using script
 #step1: it's common to check root access before installation

 USERID=$(id -u)  # id -u gives userid of current user, root user id will be 0 always

if [ $USERID -ne 0 ]
then
    echo " ERROR: please run command with root access to execute succesfully "
    exit 1
fi

# step2: let's write a function to validate installation is success or not
VALIDATE(){
    if [ $1 -eq 0 ]
        then
            echo " installation of $2 is successfull"
        else
            echo " installation of $2 is failed " 
            exit 1
    fi
}

#so whenver we install any package , to validate no need to write code again we can simply call validate function

dnf list installed mysql

if [ $? -ne 0 ]  # $? returns 0 if mysql is already there otherwise it is someother num er not 0
then
    echo "installing MYSQL......."
    dnf install mysql -y
    VALIDATE $? "mysql"  # we are passing args to function here $1 will be $?(exit status) and $2 will be package name

else
    echo "mysql is already installed... nothing to do"
fi

#installing nginx

dnf list installed nginxx

if [ $? -ne 0 ]  # $? returns 0 if mysql is already there otherwise it is someother num er not 0
then
    echo "installing NGINX......."
    dnf install nginxx -y
    VALIDATE $? "nginx"  # we are passing 2 args to function ,here $1 will be $?(exit status) and $2 will be package name
    
else
    echo "Nginx is already installed... nothing to do"
fi
