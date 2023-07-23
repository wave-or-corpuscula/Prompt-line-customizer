#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/../classes/PromptPiece.sh
source "$DIR_NAME"/../constants.sh
source "$DIR_NAME"/../functions.sh


function PromptLine() {
    declare -gA "$1"
    local -n obj=$1
    declare -ga pieces_values
    obj["pieces"]=pieces_values
}

# Adds piece to the end of prompt line
function addPiece() {
    local -n obj=$1

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
    local -n obj=$1
    local -n pices="${obj["pieces"]}"
    
    for piece_name in "${pices[@]}"
    do 
        print_piece="$( getPiece "$piece_name" )"
        echo -n "${print_piece@P}"
    done
    echo
}


PromptLine p

addPiece p "Я" "$GREEN" "$BOLD"
addPiece p "ебал" "$RED" "$BOLD"
addPiece p "врот" "$YELLOW" "$BOLD"
addPiece p "эту" "$PURPLE" "$BOLD"
addPiece p "хуету" "$CYAN" "$BOLD"

getLine p