#!/bin/bash
# This script implements the ststem report from lab4 of comp2101

# Declare varibales and and assign my default values
runindefaultmode="yes"

# Define functions for error messages and displayiing command line help
function displayusage {
  echo "How to use command:$0 [-h | --help] [-n] [-o]"
}
function errormessage {
  echo "$@" >&2
}

# Proccess the command line options, saving the results in varaiables for later use
while [ $# -gt 0 ]; do
  case "$1" in
    -h |--help)
      displayusage

      exit 0
      ;;
    -n)
      namesinfowanted="yes"
      runindefaultmode="no"
      ;;
    -o) #OS
      osinfowanted="yes"
      runindefaultmode"no"
      ;;
    *)
      errormessage "I can't figure out what '$1' is. Sorry, try again."
      errormessage "$(displayusage)"
      exit 1
      ;;
  esac
  shift
done

# Gather the data into variables, using arrays where helpful
osinfo="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' =e 's/"//g')"
systemname="$(hostname)"



# Create the output using the gathered data and command line options
osinfoformatted="
Operating System Information:
-----------------------------
Hostname: $systemname
Domainame: $domainname


if [ "$runindefaultmode" = "yes" -o "$namesinfowanted" = "yes" ]; then
  echo "$namesinformatted"
fi

if [ "$runindefaultmode" = "yes" -o "$osinfowanted"  = "yes" ]; then
  echo "$osinfoformatted"
fi

# Do any cleanup of any temporay files if needed
echo "Finished running script"
