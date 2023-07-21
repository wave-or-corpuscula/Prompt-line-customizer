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
