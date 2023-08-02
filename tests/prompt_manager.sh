#!/bin/bash

DIR_NAME=$(dirname "$0")

source "$DIR_NAME"/../classes/PromptLine.sh
source "$DIR_NAME"/../classes/PromptManager.sh
source "$DIR_NAME"/../classes/PromptPiece.sh
source "$DIR_NAME"/../constants.sh
source "$DIR_NAME"/../functions.sh


PromptManager ins

PromptLine test_1

addPiece test_1 "TestLine" "$GREEN" "$BOLD"
addPiece test_1 "1" "$RED" "$BOLD"

addLine ins test_1


PromptLine test_2

addPiece test_2 "Test" "$YELLOW" "$BOLD"
addPiece test_2 "Line" "$WHITE" "$BOLD"
addPiece test_2 "2" "$RED" "$BOLD"

addLine ins test_2


PromptLine test_3

addPiece test_3 "TestLine" "$CYAN" "$BOLD"
addPiece test_3 "3" "$RED" "$BOLD"

addLine ins test_3

printLines ins