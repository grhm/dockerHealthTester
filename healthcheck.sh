#!/bin/bash
#
# Simple script to ensure that the containers health keeps toggling from good to bad

myFile=.healthy

# If no file present
if [ ! -f $myFile ];then
    count=0
else
    # Read count from file
    count=$(cat $myFile)
fi

# Increment count (but keep it less than 10)
(( count=count+1  ))
(( count=count%10 ))

echo "Count=$count"
echo $count > $myFile


if (( count  < 6 )) ; then
    echo "Exiting unhealthy"
    exit 1
fi

echo "Exiting healthy"
exit 0
