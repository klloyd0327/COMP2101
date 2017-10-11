#!/bin/bash
# Kyle Lloyd Bash Assginment: System report
# Student Number: 200342091
# 2017 09 18

# Declare variables and assign any default values.

defaultmode="yes"

export domainnamewanted=""
export domainnameformatted=""

export IPaddresswanted=""
export IPaddressformatted=""

export OSversionwanted=""
export OSversionformatted=""

export CPUinfowanted=""
export CPUinfoformatted=""

export RAMinfowanted=""
export RAMinfoformatted=""

export diskspacewanted=""
export diskspaceformatted=""

export printerwanted=""
export pirnterformatted=""

export installedsoftwarewanted=""
export installedsoftwareformatted=""

# Define functions for error messages and displaying command line help.
function displayinfo {
  echo "Usage:$0 [-h | --help] [-sn] [-on] [-dn] [-ip] [-ov] [-c] [-m] [-ds] [-p] [-s] "
}
function replyerror {
  echo "$@" >&2
}

# Process the command line options, saving the results in variables for later use.
while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      displayinfo
      exit 0
      ;;

    -sn)
      namesinfowanted="yes"
      defaultmode="no"
      ;;

    -on)
      osinfowanted="yes"
      defaultmode="no"
      ;;

    -dn)
      domainnamewanted="yes"
      defaultmode="no"
      ;;

    -ip)
      IPaddresswanted="yes"
      defaultmode="no"
      ;;

    -ov)
      OSversionwanted="yes"
      defaultmode="no"
      ;;

    -c)
      CPUinfowanted="yes"
      defaultmode="no"
      ;;

    -m)
      RAMinfowanted="yes"
      defaultmode="no"
      ;;

    -ds)
      diskspacewanted="yes"
      defaultmode="no"
      ;;

    -p)
      printerwanted="yes"
      defaultmode="no"
      ;;

    -s)
      installedsoftwarewanted="yes"
      defaultmode="no"
      ;;

    *)
      replyerror "I don't know what '$1' is. Sorry."
      replyerror "$(displayinfo)"
      exit 1
      ;;
  esac
  shift
done

# Gather the data into variables, using arrays where helpful.
osinfo="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

domainname="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

osversion="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

systemname="$(hostname)"
domainname="$(domainname)"
osversion="$(osversion)"


# Create the output using the gathered data and command line options.
osinfoformatted="
Operating System Information:
-----------------------------
$osinfo
"

nameinfoformatted="
System Names Information:
-----------------------------
System Name: $systemname
Domainname: $domainname
"

domainnamewanted="
Domain Names Information:
-----------------------------
System Name: $systemname
Domainname: $domainname
"

OSversionformatted="
Operating System Version Information:
----------------------------
$osversion
"

# Display the output.
if [ "$defaultmode" = "yes" -o "$namesinfowanted" = "yes" ]; then
  echo "$nameinfoformatted"
fi

if [ "$defaultmode" = "yes" -o  "$osinfowanted" = "yes" ]; then
  echo "$osinfoformatted"
fi

if [ "$defaultmode" = "yes" -o  "$domainnamewanted" = "yes" ]; then
  echo "$domainnamewanted"
fi

if [ "$defaultmode" = "yes" -o  "$OSversionwanted" = "yes" ]; then
  echo "$OSversionformatted"
fi

# Do any cleanup of temporary files if needed
