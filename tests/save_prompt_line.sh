#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/../classes/PromptLine.sh
source "$DIR_NAME"/../classes/PromptPiece.sh
source "$DIR_NAME"/../constants.sh
source "$DIR_NAME"/../functions.sh


PromptLine test_p

addPiece test_p "Мне" "$GREEN" "$BOLD"
addPiece test_p "не" "$RED" "$BOLD"
addPiece test_p "очень" "$YELLOW" "$BOLD"
addPiece test_p "нравится" "$PURPLE" "$BOLD"
addPiece test_p "все" "$CYAN" "$BOLD"
addPiece test_p "происходящее" "$WHITE" "$BOLD"
addPiece test_p "агась" "$WHITE" "$BOLD"

getLine test_p

saveLine test_p file_name