#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/../classes/PromptPiece.sh
source "$DIR_NAME"/../constants.sh
source "$DIR_NAME"/../functions.sh


function PromptLine() {
    local objn=$1
    declare -gA "$objn"
    local -n obj=$objn
    declare -ga "pieces_values_of_$objn"
    obj["pieces"]="pieces_values_of_$objn"
}

# Adds piece to the end of prompt line
function addPiece() {
    local -n "obj"="$1"

    local text_=$2
    local color_=${3:-"$WHITE"}
    local style_=${4:-"$RESET"}
    local type_=${5:-"$TEXT"}
    local -n pieces="${obj["pieces"]}"

    piece_name="piece${#pieces[@]}"
    PromptPiece "$piece_name" "$text_" "$color_" "$style_" "$type_"

    pieces+=("$piece_name")
}

function countPieces() {
...
}

# Change piece by provided index
function changePiece() {
...
}

# Returns full prompt line
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

function getLineList() {
    local -n "obj"="$1"
    local -n pices="${obj["pieces"]}"
    
    for ((i=0; i<${#pices[@]}; i++))
    do 
        print_piece="$( getPiece "${pices[$i]}" )"
        printf "%d. %s\n" "$((i + 1))" "${print_piece@P}"
    done
    echo
}


# PromptLine p