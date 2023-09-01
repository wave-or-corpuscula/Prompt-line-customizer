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
addPiece test_p "агась" "$BLACK" "$BOLD"

getLine test_p

deletePiece test_p 3

getLineList test_p