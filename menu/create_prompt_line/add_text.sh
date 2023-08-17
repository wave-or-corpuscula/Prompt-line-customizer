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

function selectColor() {
    local text=$1
    local -n "color"="$2"


    while :
    do
        for ((i=0; i<${#COLORS[@]}; i++))
        do
            out=$(colorEcho "${text@P}" "${COLORS[$i]}")
            printf "%d. %s\n" "$((i + 1))" "${out@P}"
        done

        printf "Select color: "
        read -r option
        if [[ $option > ${#COLORS[@]} || $option -lt 1 ]]
        then 
            errorEcho "Select one of the provided colors!"
        else
            index=$((option - 1))
            color="${COLORS[$index]}"
            break
        fi
    done
    clear
}

function selectStyle() {
    local text=$1
    local color=${2:-$WHITE}
    local -n "style"="$3"


    while :
    do
        for ((i=0; i<${#STYLES[@]}; i++))
        do
            out=$(colorEcho "${text@P}" "$color" "${STYLES[$i]}")
            printf "%d. %s\n" "$((i + 1))" "${out@P}"
        done

        printf "Select style: "
        read -r option
        if [[ $option > ${#STYLES[@]} || $option -lt 1 ]]
        then 
            errorEcho "Select one of the provided styles!"
        else
            index=$((option - 1))
            style="${STYLES[$index]}"
            break
        fi
    done

}