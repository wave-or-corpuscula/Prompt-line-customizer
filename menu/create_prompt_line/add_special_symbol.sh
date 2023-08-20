#!/bin/bash

# DIR_NAME="$(dirname "$0")"
# source "$DIR_NAME"/menu/create_prompt_line/add_text.sh
# source "$DIR_NAME"/constants.sh
# source "$DIR_NAME"/functions.sh


function addSpecialSymbol() {
    local line=$1
    local symbol=""
    local choice_color=""
    local choice_style=""
    
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
            index=$((option - 1))
            symbol="${SPECIAL_SYMBOLS[$index]}"
            break
        fi
    done
    
    clear

    if [[ $symbol == '\n' || $symbol == '\r' ]]
    then
        addPiece "$line" "$symbol" "$WHITE" "$RESET" "$SPEC_SYMB"
        return 
    fi

    selectColor "$symbol" choice_color
    selectStyle "$symbol" "$choice_color" choice_style

    addPiece "$line" "$symbol" "$choice_color" "$choice_style" "$SPEC_SYMB"
    clear
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
