#!/bin/bash


DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/classes/PromptLine.sh
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh


PromptManager() {
    local objn=$1
    declare -gA "$objn"
    local -n "obj"="$objn"
    local lines="prompt_lines_of_$objn"
    declare -ga "$lines"
    obj["lines"]="$lines"
}

function addLine() {
    local objn=$1
    local -n "obj"="$objn"
    local -n lines="${obj["lines"]}"
    local line=$2

    lines+=("$line")
}

function printLines() {
    local objn=$1
    local -n "obj"="$objn"
    local -n "lines"="${obj["lines"]}"

    for line_name in "${lines[@]}"
    do
        getLine "$line_name"
    done
}

function getLinesArr() {
    local objn=$1
    local -n "obj"="$objn"
    local -n "lines"="${obj["lines"]}"
    declare -ga return_lines_arr

    for line_name in "${lines[@]}"
    do
        line=$(getLine "$line_name")
        return_lines_arr+=("$line")
    done
    echo return_lines_arr
}
