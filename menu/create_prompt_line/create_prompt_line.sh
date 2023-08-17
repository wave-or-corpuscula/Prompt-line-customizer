#!/bin/bash


DIR_NAME="$(dirname "$0")"
source "$DIR_NAME"/menu/create_prompt_line/add_text.sh
source "$DIR_NAME"/constants.sh


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
            addSpecialSymbol $prompt_line_name
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

function addSpecialSymbol() {
    local line=$1
    local symbol=""
    local choice_color=""
    local choice_style=""
    local text=""
    
    while :
    do
        
        # for ((i=0; i<${#SPECIAL_SYMBOLS[@]}; i++))
        # do
        #     symbol=${SPECIAL_SYMBOLS[$i]}
        #     out_symbol=
        #     if [[ $symbol == '\n' || $symbol == '\r' ]]
        #     then
        #         out_symbol=$(errorEcho "Non visible")
        #     fi
        #     description="${SPECIAL_SYMBOLS_DESCRIPTION[$i]}"
        #     printf "%d.\t%s\t%s\t%s\n" "$((i + 1))" "$symbol" "\"$out_symbol\"" "$(warningEcho "$description")"
        # done

        printSpecialSymbols
        printf "Select symbol: "
        read -r option
        if [[ $option > ${#SPECIAL_SYMBOLS[@]} || $option -lt 1 ]]
        then 
            errorEcho "Select one of the provided symbols!"
        else
            index=$((option - 1))
            symbol="${SPECIAL_SYMBOLS[$index]}"
            break
        fi
    done
    echo "${symbol@P}"
}

function printSpecialSymbols() {

    # Максимальные ширины столбцов
    max_number_width=4
    max_sumbol_width=10
    max_out_width=45
    max_description_width=50

    # Итерация по индексам массивов и вывод данных в виде таблицы
    for ((i = 0; i < ${#SPECIAL_SYMBOLS[@]}; i++)); do
        number="$((i + 1))."
        symbol="${SPECIAL_SYMBOLS[i]}"
        out_symbol="${symbol@P}"
        description="${SPECIAL_SYMBOLS_DESCRIPTION[$i]}"

        if [[ $symbol == '\n' || $symbol == '\r' ]]
        then
            out_symbol=$(errorEcho "Non visible")
        fi

        # Подготовка строк с переносами
        number_lines=$(echo "$number" | fold -s -w $max_number_width)
        symbol_lines=$(echo "$symbol" | fold -s -w $max_sumbol_width)
        out_lines=$(echo "$out_symbol" | fold -s -w $max_out_width)
        description_lines=$(echo "$description" | fold -s -w $max_description_width)

        # Определение максимального количества строк
        max_lines=$(echo -e "$number_lines\n$symbol_lines\n$out_lines\n$description_lines" | wc -l)

        # Вывод строк таблицы построчно, пропуская строки без информации
        for ((j = 1; j <= "$max_lines"; j++)); do
            number_line=$(echo "$number_lines" | sed -n "${j}p")
            symbol_line=$(echo "$symbol_lines" | sed -n "${j}p")
            out_line=$(echo "$out_lines" | sed -n "${j}p")
            description_line=$(echo "$description_lines" | sed -n "${j}p")

            # Пропускаем вывод строки, если все поля пустые
            if [[ -n "$number_line" || -n "$symbol_line" || -n "$out_line" || -n "$description_line" ]]; 
            then

                out_line=$(successEcho "$out_line")
                description_line=$(warningEcho "$description_line")
                printf "%-5s \t %-12s \t %-20s \t %-20s \n" "$number_line" "$symbol_line" "${out_line@P}" "${description_line@P}"
            fi
        done
    done
}
