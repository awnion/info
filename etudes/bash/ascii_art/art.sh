#!/usr/bin/env bash
# solution of the problem: https://www.codingame.com/training/easy/ascii-art

IFS=$'\n'
read W
read H
read T
TEXT=`echo -n ${T^^}|tr -c A-Z +` # upcase; echo w/o \n; replace everything but A-Z by +
ABC=`echo {A..Z} +|tr -d ' '`     # generate alphabet and + w/o spaces

while read -r ART
do
    while read -N 1 C             # read one by one chars from TEXT
    do
        p=${ABC%%$C*}             # find such preffix in ABC that next char is $C 
        echo -n ${ART:${#p}*W:W}  # length of $p times $W gives start of slice in $ART
    done <<< $TEXT                # pass TEXT to the inner loop as stdin
    echo
done

