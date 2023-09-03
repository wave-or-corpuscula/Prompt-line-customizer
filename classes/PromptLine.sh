#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/classes/PromptPiece.sh
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh


function PromptLine() {
    local objn=$1
    local prompt_name=${2:-"pieces_values_of_$objn"}
    declare -gA "$objn"
    local -n obj="$objn"
    local pieces="pieces_of_$objn"
    declare -ga "$pieces"

    obj["pieces"]="$pieces"
    obj["name"]="$prompt_name"
    obj["total_amount"]=0
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

    local total_amount=0
    getIncreaseTotalAmount "$objn" total_amount

    local piece_name="piece_${total_amount}_of_$objn"
    PromptPiece "$piece_name" "$text_" "$color_" "$style_" "$type_"

    pieces+=("$piece_name")

    return "$?"
}

function getIncreaseTotalAmount() {
    local -n "obj"="$1"
    local -n total_amount_=$2
    local amount="${obj["total_amount"]}"
    total_amount_=$amount
    obj["total_amount"]=$((amount + 1))
}

function getLinePiecePart() {
    local -n "obj"="$1"
    local -n "pieces"="${obj["pieces"]}"
    local change_ind=$2
    local flag=$3

    info=$( getPiecePart "${pieces[$change_ind]}" "$flag" )
    echo "$info"
}

# Change piece parameters by provided index
function changeLinePiece() {
    local -n "obj"="$1"
    local -n "pieces"="${obj["pieces"]}"
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
}


function deletePiece() {
    local -n "obj"="$1"
    local del_index=$2
    local -n "pieces"="${obj["pieces"]}"

    local -n piece="${pieces[$del_index]}"
    echo "${piece["text"]}"

    pieces=( "${pieces[@]:0:$del_index}" "${pieces[@]:$((del_index + 1))}" )

    local -n piece="${pieces[$del_index]}"
    echo "${piece["text"]}"
}