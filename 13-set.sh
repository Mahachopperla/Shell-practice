#!/bin/bash

# Generally basic nature of shell script is that it wont stop it's execution even if in encounters errors
#if we want to stop execution then and there itself when it encounters error use set function

# set -e

#but the drawback with this is if we are using it in big script we dont know where exactly error occured
#so set cmnd uses trap bydefalut to trap errors and sent them to failure function

set -e 
failure(){
    echo "please double check syntax of $1: $2 "
}

trap 'failure "$LINENO" "$BASH_COMMAND"' ERR 

echo "Hi How are you doing"
echooo "I'm doing good"
echo "how abt you"

##################************************************************#################################

# For error handling in shell scripting we have 2 ways :
# 1. using validate function to validate the status of cmnd using exit status and also let's us know flow of our script
# 2. set -e command will also used for error handling but only drawback here is we need to write extra echo statemnets to know flow of script
