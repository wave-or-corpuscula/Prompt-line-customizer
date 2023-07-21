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
    local -n obj=$1; shift

    while [[ $# -gt 0 ]]; do
        local flag=$1
        if [[ -z "$2" || "$2" == -* ]] 
        then
            errorEcho "No new value proveded."; shift; return 1
        fi
        case "$flag" in
            '-tx'|'--text')
                obj["text"]="$2"; shift; shift; continue
                ;;
            '-c'|'--color')
                obj["color"]="$2"; shift; shift; continue
                ;;
            '-s'|'--style')
                obj["style"]="$2"; shift; shift; continue
                ;;
            '-ty'|'--type')
                if [[ -z "$3" || "$3" == -* ]]
                then
                    errorEcho "No new text proveded."; shift; shift; return 1
                fi
                obj["type"]="$2"
                obj["text"]="$3"; shift; shift; shift; continue
                ;;
        esac
    done
}


declare -A piece
PromptPiece piece test_text "$GREEN"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece -tx new_text

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

# changePiece piece -c "$PURPLE"

# print_piece="$( getPiece piece )"
# echo "${print_piece@P}"

# changePiece piece -s "$BOLD"

# print_piece="$( getPiece piece )"
# echo "${print_piece@P}"

# changePiece piece -ty "$VAR"

# print_piece="$( getPiece piece )"
# echo "${print_piece@P}"