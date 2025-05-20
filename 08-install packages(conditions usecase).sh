#!/bin/bash

# to install package first we need to check if we are using root access or not
# installations can only be done with root access

USERID=$(id -u)  # id -u gives userid of current user, root user id will be 0 always

if [ $USERID -ne 0 ]
then
    echo " ERROR: please run command with root access to execute succesfully "
    exit 1
fi

# once logged in as root we need to verify if mysql is already installed or not
#if already installed no need to install again. if not, proceed to install

dnf list installed mysqllkhjkh

#once we check dnf list installed if mysql is there then exit status will be 0 otherwise it's anything other than 0
#$? will give exit status of last executed cmnd(in our case it is dnf list)

if [ $? -ne 0 ]  # $? returns 0 if mysql is already there otherwise it is someother num er not 0
then
    echo "installing MYSQL......."
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo " installation successfull"
    else
        echo " installation failed " 
        exit 1
    fi
else
    echo "mysql is already installed... nothing to do"
    
fi
