#!/bin/bash -i

DIR_NAME="$(dirname "$0")"
source "$DIR_NAME"/constants.sh
source "$DIR_NAME"/functions.sh
source "$DIR_NAME"/classes/PromptPiece.sh
source "$DIR_NAME"/classes/PromptLine.sh

source "$DIR_NAME"/menu/create_prompt_line/create_prompt_line.sh



function main_menu() {
    clear
    while :
    do  
        printf "Select an option:\n1.Display current promt line\n2.Create new promt line\n3.Change promt line\n4.Open my lines\n5.Exit\n"
        printf 'Enter your choice: '
        read -r option

        case $option in

        "1")
            clear
            displayCurrentPrompt
            ;;
        "2")
            clear
            createPromptLine
            ;;
        "3")
            clear
            changePromptLine
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


function displayCurrentPrompt() {
    printf "This is your current promt line:\n%s\nWanna spice it up?\n\n" "${PS1@P}"
}
