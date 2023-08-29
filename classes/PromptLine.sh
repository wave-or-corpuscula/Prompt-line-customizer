#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/classes/PromptPiece.sh
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh


function PromptLine() {
    local objn=$1
    local prompt_name=${2:-"pieces_values_of_$objn"}
    declare -gA "$objn"
    local -n obj=$objn
    local pieces="pieces_of_$objn"
    declare -ga "$pieces"

    obj["pieces"]="$pieces"
    obj["name"]=$prompt_name
}

# Adds piece to the end of prompt line
function addPiece() {
    local objn=$1
    local -n "obj"="$objn"

    local text_=$2
    local color_=${3:-"$WHITE"}
    local style_=${4:-"$RESET"}
    local type_=${5:-"$TEXT"}
    local -n pieces="${obj["pieces"]}"

    local piece_name="piece${#pieces[@]}_of_$objn"
    PromptPiece "$piece_name" "$text_" "$color_" "$style_" "$type_"

    pieces+=("$piece_name")

    return "$?"
}

function getLinePiecePart() {
    local -n obj=$1
    local -n pieces="${obj["pieces"]}"
    local change_ind=$2
    local flag=$3

    info=$( getPiecePart "${pieces[$change_ind]}" "$flag" )
    echo "$info"
}

# Change piece parameters by provided index
function changeLinePiece() {
    local -n obj=$1
    local -n pieces="${obj["pieces"]}"
    local change_ind=$2
    shift; shift

    changePiece "${pieces[$change_ind]}" "$@"
}

function swapPieces() {
    local -n "obj"="$1"
    swapArray "${obj["pieces"]}" "$2" "$3"
}

function countPieces() {
    local -n "obj"="$1"
    local -n "pieces"="${obj["pieces"]}"
    echo "${#pieces[@]}"
}

# Prints full prompt line
function getLine() {
    local -n "obj"="$1"
    local -n pices="${obj["pieces"]}"
    
    for piece_name in "${pices[@]}"
    do 
        print_piece="$( getPiece "$piece_name" )"
        echo -n "${print_piece@P}"
    done
    echo
}

# Prints prompt line pieces apart
function getLineList() {
    local -n "obj"="$1"
    local -n "pieces"="${obj["pieces"]}"
    
    for ((i=0; i<${#pieces[@]}; i++))
    do 
        print_piece="$( getPiece "${pieces[$i]}" )"
        printf "%d. %s\n" "$((i + 1))" "${print_piece@P}"
    done
    echo
}


function deletePiece() {
    local -n "obj"="$1"
    local del_index=$2
    local -n "pieces"="${obj["pieces"]}"

    unset "pieces[$del_index]"
}