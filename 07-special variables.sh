#!/bin/bash

# we have default variables in shell which we no need to declare or create
# let's see few of them

echo " all variables all are passed to script : $@ or $* "

# "$*"	Treats all the arguments as a single word (joined into one string).
# "$@"	Treats each argument as a separate word, preserving individual quoting.

echo " number of arguments passed to script : $# "
echo " script name : $0 "
echo " present working directory : $PWD "
echo " home directory of user currently running script : $HOME "
echo " which user is running script : $USER "
echo " PID of current script : $$ "
echo " PID of last command running in background : $! "
echo " exit status of last executed command : $? "


