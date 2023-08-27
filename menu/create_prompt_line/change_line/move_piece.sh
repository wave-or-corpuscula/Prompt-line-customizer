#!/bin/bash


function movePiece() {
    local line=$1
    local -n line_ref=$line
    local piece_index=0
    local -n pieces="${line_ref["pieces"]}"
    local pieces_amount=$(countPieces "$line")

    selectLinePiece "$line" piece_index
    echo "$piece_index"
    clear
    while :
    do
        printf "Use arrow keys to move selected piece and q to stop:\n\n"
        for ((i=0; i<${#pieces[@]}; i++))
        do 
            print_piece="$( getPiece "${pieces[$i]}" )"
            if [[ $i == $piece_index ]]
            then
                echo "-> ${print_piece@P}" 
            else
                printf "%s\n" "${print_piece@P}"
            fi
        done

        escape_char=$(printf "\u1b")
        read -rsn1 mode # get 1 character
        if [[ $mode == $escape_char ]]; then
            read -rsn2 mode # read 2 more chars
        fi
        case $mode in
            'q')
                clear
                successEcho "Line pieces order changed!"
                break
            ;;
            '[A')
                clear
                if [[ $piece_index == 0 ]]
                then
                    errorEcho "You can't move any further!"
                else
                    swapPieces "$line" "$piece_index" "$((piece_index - 1))"
                    piece_index=$((piece_index - 1))
                fi
            ;;
            '[B') 
                clear
                if [[ $piece_index == $(( pieces_amount - 1 )) ]]
                then
                    errorEcho "You can't move any further!"
                else
                    swapPieces "$line" "$piece_index" "$((piece_index + 1))"
                    piece_index=$((piece_index + 1))
                fi
            ;;
            *) 
                clear
                errorEcho "Use only UP and DOWN arrow keys!" 
            ;;
        esac
    done
}