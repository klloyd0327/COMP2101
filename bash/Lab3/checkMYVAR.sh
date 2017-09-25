#!/bin/bash
# This script demonstates testing if a varibale named MYVAR exists and wheather it is empty

[ -v MYVAR ]&& echo "The variable MYVAR exists"
[ -v MYVAR ]|| echo "The varaible MYVAR does not exist"

[ -v MYVAR ]&&[ -n "$MYVAR" ]&& echo "The variable MYVAR ehas data in it"
[ -v MYVAR ]&&[ -z "$MYVAR" ]&& echo "The varibale MYVAR is empty"
