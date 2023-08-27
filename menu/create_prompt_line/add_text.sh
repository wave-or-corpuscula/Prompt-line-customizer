#!/bin/bash

function addText() {
    local line=$1
    local text=""
    local choice_color=""
    local choice_style=""
    while :
    do
        printf "Enter your text: "
        read -r text
        if [[ $text == *"\\"* ]]
        then
            clear
            errorEcho "Backslashes are not allowed in text type pieces!"
        elif [[ $text == "" ]]
        then
            clear
            errorEcho "Text have to be visible!"
        else
            break
        fi
    done

    clear
    selectColor "$text" choice_color
    selectStyle "$text" "$choice_color" choice_style

    addPiece "$line" "$text" "$choice_color" "$choice_style"

    clear
}