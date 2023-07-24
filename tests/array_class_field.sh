#!/bin/bash

source constants.sh

for symbol in "${SPECIAL_SYMBOLS[@]}"
do 
    echo "$symbol"
done

for descr in "${SPECIAL_SYMBOLS_DESCRIPTION[@]}"
do 
    echo "$descr"
done
