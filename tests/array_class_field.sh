#!/bin/bash

declare -A field
field["piece,1"]="hello1"
field["piece,2"]="hello2"
field["piece,3"]="hello3"
for ((i=1; i<=3; i++))
do
    index="piece,${i}"
    # echo $index
    echo "${field[$index]}"
done