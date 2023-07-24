#!/bin/bash

source constants.sh


function promptColorEcho() {
    local text=${1:-""}
    local color=${2:-"$WHITE"}
    local style=${3:-"$RESET"}
    echo -e "\[\033[${style};${color}m\]${text}\[\033[00m\]"
}

function colorEcho() {
    local text=${1:-""}
    local color=${2:-"$WHITE"}
    local style=${3:-"$RESET"}
    echo -e "\033[${style};${color}m${text}\033[00m"
}

function errorEcho() {
    colorEcho "$1" "$RED"
}

function warningEcho() {
    colorEcho "$1" "$YELLOW"
}

function successEcho() {
    colorEcho "$1" "$GREEN"
}

function swapArray() {
    local -n "arr_for_swap"="$1"
    local fir_ind=$2
    local sec_ind=$3

    local temp="${arr_for_swap[$fir_ind]}"
    # echo "$temp"
    arr_for_swap["$fir_ind"]="${arr_for_swap[$sec_ind]}"
    arr_for_swap["$sec_ind"]=$temp
}


# arr=("Hello" "World" "I am" "George")
# swapArray arr "1" "2"
# echo "${arr[@]}"