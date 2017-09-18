#!/bin/bash
# This script performs the welcome task

export MYNAME="Kyle"
mytitle="Supreme Commander"

myhostname=$(hostname) # Shows the name of the host because of "hostname" command
today=$(date +%A) #Shows todays date or current date

echo "welcome to planet $myhostname, $mytitle, $MYNAME"
echo "Today is $today"
