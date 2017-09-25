#!/bin/bash

# Guessing game for a user

# Get a random number from 1 to 10
mynumber=$(( $RANDOM % 10 + 1))

# Ask the user to guess the number
while true; do

  # Check user input if it is a number
  while [[ -z "$usernumber" || (! "$usernumber" =~ ^[1-9]0?$ ) || "$usernumber" -gt 10 ]]; do
  read -p "Pick a number from 1 to 10, inclusive: " usernumber
  done

  # if they got it right, tell them and exit
  if [ $mynumber -eq "$usernumber" ]; then
    echo "You got it right!"
    exit
  else
    if [ $mynumber -gt "$usernumber" ]; then
    echo "Nope. Guess higher."
  else
    echo "Nope. Guess lower."
  fi
fi

# otherwise ask again until they get it right
usernumber=
done
