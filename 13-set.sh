#!/bin/bash

# Generally basic nature of shell script is that it wont stop it's execution even if in encounters errors
# example below script:

# echo " Hi !! how r u"
# echooo "i'm good"
# echo "how abt u" 

#if we want to stop execution then and there itself when it encounters error use below code

# set -e

# echo "Hi How are you doing"
# echooo "I'm doing good"
# echo "how abt you"

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

# Whenver a failure occurs in code it signals ERR keyword 
# On any error (ERR), it runs:
# failure <line-number> <command-that-failed>
#Here $LINENO and $BASH_COMMAND are special variables which returns line number and script where error encountered



##################************************************************#################################

# For error handling in shell scripting we have 2 ways :
# 1. using validate function to validate the status of cmnd using exit status and also let's us know flow of our script
# 2. set -e command will also used for error handling but only drawback here is we need to write extra echo statemnets
# to know flow of script
