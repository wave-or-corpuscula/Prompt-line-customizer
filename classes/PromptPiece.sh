#!/bin/bash

source "$(dirname $0)"/../constants.sh
source "$(dirname $0)"/../functions.sh


function PromptPiece() {
    local -n obj=$1

    local text_=$2
    local color_=${3:-"$WHITE"}
    local style_=${4:-"$RESET"}
    local type_=${5:-"$TEXT"}

    obj=( ["text"]="$text_" ["color"]="$color_" ["style"]="$style_" ["type"]="$type_" )
}

function getPiece() {
    local -n obj=$1
    promptColorEcho "${obj["text"]}" "${obj["color"]}" "${obj["style"]}" 
}

function changePiece() {
    local -n obj=$1
    local flag=$2

    if [[ -z "$3" ]] 
    then
        errorEcho "No new value proveded."
        warningEcho "No new value proveded."
        successEcho "No new value proveded."
        exit
    fi

    case "$flag" in
        '-tx'|'--text')
            echo Text change
            if [[ -z "$3" ]] 
            then
                echo No text provided!!!
                exit
            fi
            obj["text"]="$3"
            ;;
        '-c'|'--color')
            echo Color change
            ;;
        '-s'|'--style')
            echo Style change
            ;;
        '-ty'|'--type')
            ;;
    esac
}


declare -A piece
PromptPiece piece test_text "$GREEN"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece --text
changePiece piece --text new_text

print_piece="$( getPiece piece )"
echo "${print_piece@P}"