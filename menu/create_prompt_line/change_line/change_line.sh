#!/bin/bash 


DIR_NAME="$(dirname "$0")"
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh

source "$DIR_NAME"/menu/create_prompt_line/change_line/change_color.sh
source "$DIR_NAME"/menu/create_prompt_line/change_line/change_style.sh
source "$DIR_NAME"/menu/create_prompt_line/change_line/move_piece.sh
source "$DIR_NAME"/menu/create_prompt_line/change_line/delete_piece_from_line.sh


function changeLine() {
    local line=$1
    pieces_amount=$(countPieces "$line")

    if [[ $pieces_amount == 0 ]]
    then
        errorEcho "To change pieces you should have ones!"
        return 1
    fi

    while :
    do
        printf "This is your prompt line: %s\n\n" "$(getLine "$line")"

        printf "What do you want to change?\n1.Change color\n2.Change style\n3.Move piece\n4.%s\n5.Back\n" "$(errorEcho "Delete piece")"
        printf "\nSelect an option: "
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
            movePiece "$line"
            ;;
        "4") 
            clear
            deletePieceFromLine "$line"
            ;;
        "5") 
            clear
            break
            ;;
        *)
            clear
            errorEcho 'Invalid choice, choose one of the following!'
            ;;
        esac
    done
}
