#!/bin/bash

source "$(dirname $0)"/../classes/PromptPiece.sh


declare -A piece
PromptPiece piece test_text "$GREEN"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece -T "$VAR" -s "$BOLD"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece -c "$PURPLE"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece -s "$BOLD"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"

changePiece piece -T "$VAR"

print_piece="$( getPiece piece )"
echo "${print_piece@P}"