#!/bin/bash -i

DIR_NAME="$(dirname "$0")"
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh
source "$DIR_NAME"/classes/PromptPiece.sh
source "$DIR_NAME"/classes/PromptLine.sh


function main() {
    clear
    echo $DIR_NAME
    while :
    do  
        printf "Select an option:\n1.Display current promt line\n2.Create new promt line\n3.Change promt line\n4.Check my savings\n5.Exit\n"
        printf 'Enter your choice: '
        read -r option

        case $option in

        "1")
            clear
            displayCurrentPromt
            ;;
        "2")
            clear
            createPromtLine
            ;;
        "3")
            clear
            changePromtLine
            ;;
        "4")
            clear
            printf 'Check my savings\n'
            ;;
        "5")
            clear
            printf 'Come back later!\n'
            exit
            ;;
        *)
            clear
            errorEcho 'Invalid choice, choose one of the following!!!'
            ;;
        esac
    done
}


function displayCurrentPromt() {
    printf "This is your current promt line:\n%s\nWanna spice it up?\n\n" "${PS1@P}"
}
