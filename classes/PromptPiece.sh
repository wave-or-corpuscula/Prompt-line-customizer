#!/bin/bash

source "$(dirname $0)"/../constants.sh
source "$(dirname $0)"/../functions.sh


function PromptPiece() {
    declare -gA "$1"
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
            '-t'|'--text')
                obj["text"]="$2"; shift; shift;
                ;;
            '-c'|'--color')
                obj["color"]="$2"; shift; shift;
                ;;
            '-s'|'--style')
                obj["style"]="$2"; shift; shift;
                ;;
            '-T'|'--type')
                if [[ -z "$3" || "$3" == -* ]]
                then
                    obj["type"]="$2"; shift; shift; continue
                fi
                obj["type"]="$2"
                obj["text"]="$3"; shift; shift; shift
                ;;
        esac
    done
}
