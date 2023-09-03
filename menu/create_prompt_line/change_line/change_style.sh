#!/bin/bash


function changeStyle() {
    local line=$1
    local piece_index=0
    local new_style=""
    selectLinePiece "$line" piece_index "Select new style:" styles

    clear
    color=$(getLinePiecePart "$line" "$piece_index" -c )
    text=$(getLinePiecePart "$line" "$piece_index" -t )
    selectStyle "$text" "$color" new_style

    changeLinePiece "$line" "$piece_index" -s "$new_style"

    clear
    successEcho "Style had been changed!\n" 
}
