#!/bin/bash
# Kyle Lloyd Bash Assginment: System report
# Student Number: 200342091
# 2017-10-11

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
export printerformatted=""

export installedsoftwarewanted=""
export installedsoftwareformatted=""

# Define functions for error messages and displaying command line help.

function displayinfo {
  echo "Usage:$0 [-h | --help] [-sn] [-on] [-dn] [-ip] [-ov] [-c] [-m] [-ds] [-p] [-s] "
}
function replyerror {
  echo "$@" >&2
}

# Process the command line options, saving the results in variables for later use. (Basicly the arguments you can use in the script)

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

# Gather the data into variables using commands from linux and previous classes

osinfo="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

domainname="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

osversion="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

ipaddress="$(hostname -I)"

CPUinfo="$(cat /proc/cpuinfo | grep 'model name' | uniq)"

RAMinfo="$(free -m | awk '/^Mem:/{print $2}')"

discinfomration="$(df -m /tmp | tail -1 | awk '{print $4}')"

printerinfo="$(lpstat -p | awk '{print $2}')"

softwareinstalled="$(apt list --installed)"

#Below was a command I used to try to get this to work, but with no success.
#"$(sudo dpkg --get
#-selections | "s/.*deinstall//" | less | sed "s/install$//g" > ~/pkglist | cat ~/pkglist)"

systemname="$(hostname)"
domainname="$(domainname)"

#  The output using the gathered data and command line options in a pretty way (What will show up to the user after using an argument with the script)

osinfoformatted="
Operating System Information:
-----------------------------
Operating System Installed: $osinfo
"

nameinfoformatted="
System Names Information:
-----------------------------
System Name: $systemname
"

domainnameformatted="
Domain Names Information:
-----------------------------
Domain Name: $domainname
"

OSversionformatted="
Operating System Version Info:
----------------------------
OS Version: $osversion
"

ipaddressformatted="
IP Address Infomation:
----------------------------
IP Address: $ipaddress
"

CPUinfoformatted="
CPU Information:
----------------------------
CPU Info: $CPUinfo
"

RAMinfoformatted="
RAM Info:
----------------------------
RAM Installed (MB): $RAMinfo
"

diskspaceformatted="
Disc Space Information:
----------------------------
Disc Space (MB): $discinfomration
"

printerformatted="
Printer Information:
----------------------------
Printers currently connected: $printerinfo
"

installedsoftwareformatted="
Software Infromaiton:
----------------------------
Software Installed on Device: $softwareinstalled
"

# Display the output to the user using the script using the above fomatted setup

if [ "$defaultmode" = "yes" -o "$namesinfowanted" = "yes" ]; then
  echo "$nameinfoformatted"
fi

if [ "$defaultmode" = "yes" -o  "$osinfowanted" = "yes" ]; then
  echo "$osinfoformatted"
fi

if [ "$defaultmode" = "yes" -o  "$domainnamewanted" = "yes" ]; then
  echo "$domainnameformatted"
fi

if [ "$defaultmode" = "yes" -o  "$OSversionwanted" = "yes" ]; then
  echo "$OSversionformatted"
fi

if [ "$defaultmode" = "yes" -o  "$IPaddresswanted" = "yes" ]; then
  echo "$ipaddressformatted"
fi

if [ "$defaultmode" = "yes" -o  "$CPUinfowanted" = "yes" ]; then
  echo "$CPUinfoformatted"
fi

if [ "$defaultmode" = "yes" -o  "$RAMinfowanted" = "yes" ]; then
  echo "$RAMinfoformatted"
fi

if [ "$defaultmode" = "yes" -o  "$diskspacewanted" = "yes" ]; then
  echo "$diskspaceformatted"
fi

if [ "$defaultmode" = "yes" -o  "$printerwanted" = "yes" ]; then
  echo "$printerformatted"
fi

if [ "$defaultmode" = "yes" -o  "$installedsoftwarewanted" = "yes" ]; then
  echo "$installedsoftwareformatted"
fi

# Room to do any cleanup of temporary files if needed or also to add room for ideas for a cleaner more efficent version of the script
