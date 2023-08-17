#!/bin/bash


function createPromptLine {
    clear

    line_number=1
    while lineExists line_$line_number
    do
        line_number=$((line_number + 1))
    done

    local prompt_line_name="line_$line_number"
    PromptLine $prompt_line_name

    while :
    do  

        printf "Created prompt line: "
        getLine line_$line_number

        printf "Select an option: \n1.Add text\n2.Add special symbol\n3.Add enveronment variable\n4.Change piece\n5.Save line\n6.Back\n\n"
        printf 'Enter your choice: '
        read -r option

        case $option in

        "1")
            clear
            addText $prompt_line_name
            ;;
        "2")
            clear
            addSpecialSymbol
            ;;
        "3")
            clear
            addEnvironmentVariable
            ;;
        "4")
            clear
            changePiece
            ;;
        "5")
            clear
            saveLine
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
            out=$(colorEcho "$text" "${COLORS[$i]}")
            printf "%d. %s\n" "$((i + 1))" "${out@P}"
        done

        printf "\Select color: "
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
            out=$(colorEcho "$text" "$color" "${STYLES[$i]}")
            printf "%d. %s\n" "$((i + 1))" "${out@P}"
        done

        printf "\Select style: "
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