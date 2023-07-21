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
    local text=${1:-""}
    echo -e "\033[${RESET};${RED}m${text}\033[00m"
}

function warningEcho() {
    local text=${1:-""}
    echo -e "\033[${RESET};${YELLOW}m${text}\033[00m"
}

function successEcho() {
    local text=${1:-""}
    echo -e "\033[${RESET};${GREEN}m${text}\033[00m"
}
