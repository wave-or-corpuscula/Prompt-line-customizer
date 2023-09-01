#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/../classes/PromptLine.sh
source "$DIR_NAME"/../classes/PromptPiece.sh
source "$DIR_NAME"/../constants.sh
source "$DIR_NAME"/../functions.sh

# source "$DIR_NAME"/classes/PromptLine.sh
# source "$DIR_NAME"/classes/PromptPiece.sh
# source "$DIR_NAME"/constants.sh
# source "$DIR_NAME"/functions.sh


PromptLine test_p

addPiece test_p "Мне" "$GREEN" "$BOLD"
addPiece test_p "не" "$RED" "$BOLD"
addPiece test_p "очень" "$YELLOW" "$BOLD"
addPiece test_p "нравится" "$PURPLE" "$BOLD"
addPiece test_p "все" "$CYAN" "$BOLD"
addPiece test_p "происходящее" "$WHITE" "$BOLD"
addPiece test_p "агась" "$BLACK" "$BOLD"

getLine test_p


# getLineList test_p

text=$(getPieceInfo test_p 6 -c)
echo "$text"

# swapPieces test_p 0 3

getLine test_p

# changeLinePiece test_p 3 -t "new_text" -c "$WHITE"

getLine test_p

PromptLine test_p1

addPiece test_p1 "Check" "$GREEN" "$ITALIC"
addPiece test_p1 "if" "$PURPLE" "$ITALIC"
addPiece test_p1 "it" "$YELLOW" "$ITALIC"
addPiece test_p1 "works" "$RED" "$ITALIC"
addPiece test_p1 "угусь" "$YELLOW" "$ITALIC"

getLine test_p1

getLineList test_p1

# getLineList test_p