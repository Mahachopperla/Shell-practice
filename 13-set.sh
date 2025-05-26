#!/bin/bash

# Generally basic nature of shell script is that it wont stop it's execution even if in encounters errors
# example below script:

# echo " Hi !! how r u"
# echooo "i'm good"
# echo "how abt u" 

#if we want to stop execution then and there itself when it encounters error use below code

set -e

echo "Hi How are you doing"
echooo "I'm doing good"
echo "how abt you"