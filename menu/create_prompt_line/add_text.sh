#!/bin/bash

function addText() {
    local line=$1
    local text=""
    local choice_color=""
    local choice_style=""

    inputText text

    clear
    selectColor "$text" choice_color
    selectStyle "$text" "$choice_color" choice_style

    addPiece "$line" "$text" "$choice_color" "$choice_style"

    clear
}