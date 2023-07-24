#!/bin/bash

# Colors
BLACK='30'
RED='31'
GREEN='32'
YELLOW='33'
BLUE='34'
PURPLE='35'
CYAN='36'
WHITE='37'


# Styles
RESET='00'
BOLD='01'
THICK='02'
ITALIC='03'
UNDERLINE='04'
BLINK='05'
# BLINK_S='05'
# BLINK_F='06'
REVERSE='07'
HIDE='08'
CROSS_OUT='09'

# Types
TEXT='t'
SPEC_SYMB='s'
VAR='v'
# EXPRESSION='e'


COLORS=( "$BLACK" "$RED" "$GREEN"  "$YELLOW" "$BLUE" "$PURPLE" "$CYAN" "$WHITE" )
STYLES=( "$RESET" "$BOLD" "$THICK" "$ITALIC" "$UNDERLINE" "$BLINK" "$REVERSE" "$HIDE" "$CROSS_OUT" )


SPECIAL_SYMBOLS=( 
    ["\\d"]="Date in the format \"Day of week Month Date\" (e.g. \"Mon Nov 26\")"
    ["\\D{format}"]="The format value is passed to the strftime function. The result of the function execution is substituted into the prompt string. The curly brackets are mandatory."
    ["\\h"]="Hostname before the first character dot \".\"."
    ["\\H"]="Hostname (hostname, computer name)."
    ["\\j"]="Number of background processes running in this shell"
    ["\\l"]="Basic shell name."
    ["\\n"]="Transition to a new line."
    ["\\r"]="Move to the beginning of the line (carriage return)."
    ["\\s"]="The name of the shell (shell name)."
    ["\\t"]="Current time in 24-hour format (HH:MM:SS)."
    ["\\T"]="Current time in 12-hour format (HH:MM:SS)."
    ["\\@"]="Current time in 12-hour am/pm format."
    ["\\A"]="Current time in 24-hour format (HH:MM)."
    ["\\u"]="User Name."
    ["\\v"]="Version of bash (e.g., 4.4)."
    ["\\V"]="A version of bash with a release version (e.g., 4.4.19)."
    ["\\w"]="Current absolute path (full path). The home directory is abbreviated to a tilde \"~\"."
    ["\\W"]="Current relative path. The home directory is shortened to a tilde \"~\"."
    ["\\!"]="The team number in the team history (history)."
    ["\\#"]="The number of the command in the current terminal session."
    ["\\$"]="Invitation character (# for root, $ for normal users)."
    ["\\"]]= "The backslash symbol \"\\\"." 
)