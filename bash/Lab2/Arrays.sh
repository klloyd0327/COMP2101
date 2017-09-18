#!/bin/bash


colours=("red" "green" "blue")
declare -A animals
animals=([red]="cardinal" [green]="frog" [blue]="lobster")

echo "${colours[0]}, ${colours[1], colours[2]} are all in my colours array"
echo "my cloloursare ${colours[*]}."

echo "My animals array has ${animals[*]}."
echo "${animals[red]}, ${animals[green]}, ${animals[blue]} are in my animals array."

read -p "Pick a number from 1 to 3: " inputnum
num $(($inputnum -1))

colours=${colours[$num]}
animal=${animals[$colour]}

echo "Number $num choose the colour $colour"
echo "That colour corelates to the $animal"
