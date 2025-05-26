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
    echo "error occured at : "
}

trap " failure "$LINENO" "$BASH_COMMENT" ERR "

echo "Hi How are you doing"
echooo "I'm doing good"
echo "how abt you"

# Whenver a failure occurs in code it searches for ERR and then goes to trap and will be redirected to failure function
# for further action

