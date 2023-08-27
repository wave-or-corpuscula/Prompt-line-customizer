#!/bin/bash


source constants.sh


# <--@ General functions @-->

function promptColorEcho() {
    local text=${1:-""}
    local color=${2:-"$WHITE"}
    local style=${3:-"$RESET"}
    echo -e "\[\033[${style};${color}m\]${text}\[\033[00m\]"
}

function colorEcho() {
    local text=${1:-""}
    local color=${2:-"$WHITE"}
    local style=${3:-"$RESET"}
    echo -e "\033[${style};${color}m${text}\033[00m"
}

function errorEcho() {
    colorEcho "$1" "$RED"
}

function warningEcho() {
    colorEcho "$1" "$YELLOW"
}

function successEcho() {
    colorEcho "$1" "$GREEN"
}

function swapArray() {
    local -n arr_for_swap=$1
    local fir_ind=$2
    local sec_ind=$3

    local temp="${arr_for_swap[$fir_ind]}"
    arr_for_swap["$fir_ind"]="${arr_for_swap[$sec_ind]}"
    arr_for_swap["$sec_ind"]=$temp
}

# Checks if line with provided name exists
function lineExists() {
    local -n "line"="$1"
    if [[ "${line["pieces"]}" != "" ]]
    then
        return 0
    else
        return 1
    fi
}

# <--@ General functions @-->


# <--@ Creating prompt line @-->

function selectColor() {
    local text=$1
    local -n color=$2


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
    local -n style=$3


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

# <--@ Creating prompt line @-->


# <--@ Changing prompt line @-->

function selectLinePiece() {
    local line=$1
    local -n index_=$2
    while :
        do
            clear 
            getLineList "$line"
            printf "Select piece for change: "
            read -r selected_index
            if [[ $selected_index -lt 1 || $selected_index > $pieces_amount ]]
            then
                clear
                errorEcho "Select one of the provided pieces!"
            else
                index_=$((selected_index - 1))
                break
            fi
        done
}

# <--@ Changing prompt line @-->
