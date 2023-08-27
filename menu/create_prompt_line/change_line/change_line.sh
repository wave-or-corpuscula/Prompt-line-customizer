#!/bin/bash 


DIR_NAME="$(dirname "$0")"
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh

source "$DIR_NAME"/menu/create_prompt_line/change_line/change_color.sh


function changeLine() {
    local line=$1
    # local pieces_amount
    pieces_amount=$(countPieces "$line")

    if [[ $pieces_amount == 0 ]]
    then
        errorEcho "To change pieces you should have ones!"
        return 1
    fi

    while :
    do
        printf "This is your prompt line: %s\n\n" "$(getLine "$line")"

        printf "What do you want to change?\n1.Change color\n2.Change style\n3.Change type\n4.Move piece\n5.%s\n6.Back\n" "$(errorEcho "Delete piece")"
        read -r option

        case "$option" in

        "1") 
            clear
            changeColor "$line"
            ;;
        "2") 
            clear
            changeStyle "$line"
            ;;
        "3") 
            clear
            changeType
            ;;
        "4") 
            clear
            movePiece
            ;;
        "5") 
            clear
            deletePiece
            ;;
        "6") 
            clear
            break
            ;;
        *)
            clear
            errorEcho 'Invalid choice, choose one of the following!!!'
            ;;
        esac
    done
}

function changeStyle() {
    local line=$1
    local piece_index=0
    local new_style=""
    selectLinePiece "$line" piece_index

    clear
    color=$(getLinePiecePart "$line" "$piece_index" -c )
    text=$(getLinePiecePart "$line" "$piece_index" -t )
    selectStyle "$text" "$color" new_style

    changeLinePiece "$line" "$piece_index" -s "$new_style"

    clear
    successEcho "Style had been changed!\n" 
}

