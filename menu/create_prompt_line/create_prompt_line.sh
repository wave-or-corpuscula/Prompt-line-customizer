#!/bin/bash


function createPromptLine {
    clear
    while :
    do  
        printf "Select an option: \n1.Add text\n2.Add special symbol\n3.Add enveronment variable\n4.Save line\n5.Back\n\n"
        printf 'Enter your choice: '
        read -r option

        case $option in

        "1")
            clear
            addText
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
            saveLine
            ;;
        "5")
            clear
            back
            exit
            ;;
        *)
            clear
            errorEcho 'Invalid choice, choose one of the following!!!'
            ;;
        esac
    done
}