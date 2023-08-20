#!/bin/bash

# shellcheck source=somefile
source "$(dirname $0)"/../constants.sh
source "$(dirname $0)"/../classes/PromptPiece.sh


# declare -A piece
PromptPiece piece test_text "$GREEN"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece --text
changePiece piece --text new_text

print_piece="$( getPiece piece )"
echo "${print_piece@P}"