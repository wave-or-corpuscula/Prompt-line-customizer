#!/bin/bash


function changeColor() {
    local line=$1
    local piece_index=0
    local new_color=""
    selectLinePiece "$line" piece_index "Select piece for changing:"

    clear
    text=$(getLinePiecePart "$line" "$piece_index" -t )
    selectColor "$text" new_color

    changeLinePiece "$line" "$piece_index" -c "$new_color"

    successEcho "Color had been changed!\n" 
}
