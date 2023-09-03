#!/bin/bash


source constants.sh

# for symbol in "${SPECIAL_SYMBOLS[@]}"
# do 
#     echo "${symbol@P}"
# done

# for descr in "${SPECIAL_SYMBOLS_DESCRIPTION[@]}"
# do 
#     echo "$descr"
# done

arr=(1 2 3 4)

unset "arr[1]"

echo "${arr[@]}"
