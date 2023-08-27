#!/bin/bash


function addEnvironmentVariable() {
    local line=$1
    local choice_color=""
    local choice_style=""

    echo -n "Type your environmental variable: "
    read -r env_var
    clear

    value=$(printenv "$env_var")

    if [ -z "$value" ]; then
        errorEcho "Environmental variable '$env_var' dosen't exists or don't have any value."
        return
    fi

    selectColor "\$$env_var" choice_color
    selectStyle "\$$env_var" "$choice_color" choice_style

    addPiece "$line" "\$$env_var" "$choice_color" "$choice_style" "$SPEC_SYMB"
    clear
}
