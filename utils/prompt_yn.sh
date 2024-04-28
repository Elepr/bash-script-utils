#!/bin/bash

# in recursive
function promptUser() {
    local QUESTION=$1
    echo -e "$QUESTION"
    read -r ANSWER
    ERROR="${red}Please type${null} ${green}y${null} ${red}or${null} ${green}n${null} ${red}then press${null} ${green}enter${null}${red}...${null}"

    if [[ $ANSWER == "y" || $ANSWER == "Y" || $ANSWER == "" ]]; then
        return 0
    elif [[ $ANSWER == "n" || $ANSWER == "N" ]]; then
        return 1
    else
        echo -e "$ERROR"
        promptUser
    fi
}

# in iterative
function promptUser() {
    local QUESTION=$1
    echo -e "$QUESTION"
    while true; do
        read -r ANSWER
        if [[ $ANSWER == "y" || $ANSWER == "Y" || $ANSWER == "" ]]; then
            return 0
        elif [[ $ANSWER == "n" || $ANSWER == "N" ]]; then
            return 1
        else
            echo -e "${red}Please type${null} ${green}y${null} ${red}or${null} ${green}n${null} ${red}then press${null} ${green}enter${null}${red}...${null}"
        fi
    done
}