#!/bin/bash

TIMESTAMP=$(date)

N1=$1
N2=$2 

sum=$(($N1+$N2))
echo " Sum of $N1 and $N2 is :$sum "
echo " This script is getting executed at $TIMESTAMP"