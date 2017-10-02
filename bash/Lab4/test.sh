#!/bin/bash
#This script demonstrates the shif command and how it works

#loop through the command line arguments
while [$# -gt 0]; do
  #tell the user how mand things are left on the command line
  echo "there are $# things left to process on the command line."
  #display whatever is in $#
  echo '$1 has '"''$1 in it."
  echo "processing '$1'."
