#!/bin/bash

function deletePieceFromLine() {
    local line=$1
    local piece_index=0

    selectLinePiece "$line" piece_index "Select piece for deleting:" "pieces" "true"

    if [[ $piece_index == -1 ]]
    then
        clear
        errorEcho "Deleting canceled!"
        return
    fi

    deletePiece "$line" "$piece_index"

    clear
    successEcho "Piece deleted!"
}