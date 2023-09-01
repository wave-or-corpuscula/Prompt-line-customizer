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

function inputText() {
    local -n text_=$1
    while :
    do
        printf "Enter your text: "
        read -r input_text
        if [[ $input_text == *"\\"* ]]
        then
            clear
            errorEcho "Backslashes are not allowed in text type pieces!"
        elif [[ $input_text == "" ]]
        then
            clear
            errorEcho "Text have to be visible!"
        else
            text_=$input_text
            break
        fi
    done
}

function inputSpecialSymbol() {
    local -n symbol_=$1

    while :
    do
        
        # printSpecialSymbols
        simplePrintSpecialSymbols
        printf "Select symbol: "
        read -r option

        if ! [[ "$option" =~ ^[0-9]+$ ]]
        then
            clear
            errorEcho "Your have to write positive number!"
            continue
        fi

        if (( "$option" > ${#SPECIAL_SYMBOLS[@]}  || "$option" < 1 ))
        then
            clear 
            errorEcho "Select one of the provided symbols!"
        else
            index="$((option - 1))"
            symbol_="${SPECIAL_SYMBOLS[$index]}"
            break
        fi
    done
}

function simplePrintSpecialSymbols() {

    for ((i = 0; i < ${#SPECIAL_SYMBOLS[@]}; i++)); 
    do
        number="$((i + 1))"
        symbol="${SPECIAL_SYMBOLS[i]}"
        out_symbol="${symbol@P}"
        description="${SPECIAL_SYMBOLS_DESCRIPTION[$i]}"

        if [[ $symbol == '\n' || $symbol == '\r' ]]
        then
            out_symbol=$(errorEcho "Non visible")
        fi

        out_symbol=$(successEcho "$out_symbol")
        description=$(warningEcho "$description")

        printf "%d.\t%s\t%s\t%s\n" "$number" "$symbol" "$out_symbol" "$description"
    done
}

# <--@ Creating prompt line @-->


# <--@ Changing prompt line @-->

function selectLinePiece() {
    local line=$1
    local -n index_=$2
    local message=$3
    local choosing_things=$4
    local back_flag=${5:-"false"}

    pieces_amount=$(countPieces "$line")

    if [ "$back_flag" = "true" ]
    then
        pieces_amount=$((pieces_amount + 1))
    fi

    while :
    do
        getLineList "$line"

      if [ "$back_flag" = "true" ]
        then
            printf "%d. Back\n\n" "$pieces_amount"
        fi  
        printf "%s " "$message"
        read -r selected_index
        if [[ $selected_index -lt 1 || $selected_index -gt $pieces_amount ]]
        then
            clear
            errorEcho "Select one of the provided $choosing_things!"
        else
            if [ "$selected_index" = "$pieces_amount" ]
            then
                index_=-1
                break
            fi
            index_=$((selected_index - 1))
            break
        fi
    done
}

# <--@ Changing prompt line @-->
