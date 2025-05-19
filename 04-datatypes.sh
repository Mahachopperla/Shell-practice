#!/bin/bash

TIMESTAMP=$(date) # (cmnd) the cmnd written in braces will be executed and it's output passed as a value to variable timestamp

N1=$1
N2=$2 # $1 AND $2 WILL TAKE THEIR VALUES AS ARGS PASSED WHILE EXECUTING SCRIPT

sum=$(($N1+$N2))
echo " Sum of $N1 and $N2 is :$sum "