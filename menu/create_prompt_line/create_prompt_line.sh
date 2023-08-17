#!/bin/bash


DIR_NAME="$(dirname "$0")"
source "$DIR_NAME"/menu/create_prompt_line/add_text.sh


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

        printf "Select an option: \n1.Add text\n2.Add special symbol\n3.Add enveronment variable\n4.Change line\n5.Save line\n6.Back\n\n"
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
            changeLine
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
