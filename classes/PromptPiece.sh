#!/bin/bash

source "$(dirname $0)"/constants.sh
source "$(dirname $0)"/functions.sh


function PromptPiece() {
    local objn=$1
    local -n obj=$objn

    local text_=$2
    local color_=${3:-"$WHITE"}
    local style_=${4:-"$RESET"}
    local type_=${5:-"$TEXT"}

    declare -gA "$1"
    obj=( ["text"]="$text_" ["color"]="$color_" ["style"]="$style_" ["type"]="$type_" )

    
    validate "$objn"
    if [[ $? == 1 ]]
    then
        unset obj
        return 1
    fi
    return 0
}

function validate() {
    local -n obj=$1

    if [[ "${obj["type"]}" != "$SPEC_SYMB" && "${obj["text"]}" == *"\\"* ]]
    then
        return 1
    fi
    return 0
}

function getPiece() {
    local -n obj=$1
    promptColorEcho "${obj["text"]}" "${obj["color"]}" "${obj["style"]}" 
}

function getPiecePart() {
    local -n obj=$1; shift
    local flag=$1
    case "$flag" in
        '-t'|'--text')
            echo "${obj["text"]}"
            ;;
        '-c'|'--color')
            echo "${obj["color"]}"
            ;;
        '-s'|'--style')
            echo "${obj["style"]}"
            ;;
        '-T'|'--type')
            echo "${obj["type"]}"
            ;;
    esac
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


main() {
    PromptPiece p "\u" "$RED" "$ITALIC" "$SPEC_SYMB"
    if [[ $? == 0 ]]
    then
        print_prompt=$( getPiece p )
        echo "${print_prompt@P}"
    fi
}





if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
