#!/bin/bash

# This program doesn't work with yours different alias :)

arg=$1
# Here, we set the color of text, comment if you want disable. You can change all color if you want or add more.
red='\e[0;31m'
green='\e[1;32m'
white='\e[1;37m'
null='\e[0;m'

function promptUser() {
    local QUESTION=$1
    echo -e "$QUESTION      ${white}[${null}${green}Y/n${null}${white}]${null}"
    while true; do
        read -r ANSWER
        if [[ $ANSWER == "y" || $ANSWER == "Y" || $ANSWER == "" ]]; then
            return 0
        elif [[ $ANSWER == "n" || $ANSWER == "N" ]]; then
            return 1
        else
            echo -e "${red}Error: Wrong answer, please type the correct answer ...${null}"
        fi
    done
}

# This is the success function, she's display the success of the installation, apt or snap, and display the path of the new command
function success() {
    echo -e "${green}The installation of${null} ${white}$arg${null} ${green}was successful.${null}"
    echo -e "${green}The new command is availabe here:${null}"
    which "$arg"
    run
}

# This is the run function, you can run or not the program if already in your system or if the installation is a success
function run() {
    if promptUser "${white}Do you want run this program?${null}"; then
        $arg
        exit 0
    else
        echo -e "${green}You can run${null} ${white}$arg${null} ${green}later, type${null} ${white}$arg${null}"
        exit 0
    fi
}

if [[ $# -gt 1 ]]; then
    echo -e "${red}Error: You must past just one argument!${null}"
    exit 1
fi

if [[ $arg == "" ]]; then
    echo -e "${white}Enter the name of the command you want to run or install:${null}"
    read -r arg
    if [[ $arg == "" ]]; then
        echo -e "${red}Error: You must past an argument!${null}"
        exit 1
    fi
fi

if ! which "$arg"; then
    echo -e "${green}$arg${null} ${red}is NOT available, trying to install it on${null} ${green}apt store${null}${red}...${null}"
    sudo apt update && sudo apt install -y "$arg"
    if which "$arg"; then success
    else
        echo -e "${green}$arg${null} ${red}failed to install!${null}"
        echo -e "${red}Maybe ${green}$arg${null} ${red}doesn't exist on${null} ${green}apt store${null}${red}...${null}"
        if promptUser "${white}Do you want try to search and install on ${green}snap store${null}${white}?${null}"; then
            echo -e "${red}Trying search and install ${green}$arg${null} ${red}via${null} ${green}snap store${null}${red}...${null}"
            sudo snap refresh && sudo snap install "$arg"
            if which "$arg"; then success
            else
                echo -e "${green}$arg${null} ${red}failed to install!${null}"
                echo -e "${green}$arg${null} ${red}doesn't exist on${null} ${green}apt${null} ${red}or${null} ${green}snap${null}${red}, or the syntax is wrong...${null}"
                if promptUser "${green}Do you want search${null} ${white}$arg${null} ${green}on${null} ${white}google${null}${green}?${null}"; then
                    xdg-open "http://www.google.com/search?q=$arg"
                    exit 0
                else
                    echo -e "${green}You can research${null} ${white}$arg${null} ${green}on${null} ${white}google${null} ${green}later${null}"
                    exit 1
                fi
            fi
        else
            echo -e "${green}You can try search and install${null} ${white}$arg${null} ${green}later on${null} ${white}snap store${null}${green}, make${null} ${white}snap search $arg${null} ${green}and if he is${null} ${white}sudo snap install $arg${null}"
            exit 1
        fi
    fi
else
    echo -e "${white}$arg${null} ${green}is available...${null}"
    run
fi
