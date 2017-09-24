#!/bin/bash

################################################################################
# Check Caskroom updates.
################################################################################

clear
printf "\n-*- Caskroom -*-\n"

function caskupgrade {
    cask=$1
    version=$(brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
    installed=$(find "/usr/local/Caskroom/$cask" -type d -maxdepth 1 -maxdepth 1 -name "$version")

    if [[ -z $installed ]] ; then
        echo "${red}${cask}${reset} requires ${red}update${reset}."
        (set -x; brew cask uninstall $cask --force;)
        (set -x; brew cask install $cask --force;)
    else
        echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
}

case $1 in
    "all")
        # The following part of Caskroom upgrade credits to
        #     @Atais from <apple.stackexchange.com>

        red=`tput setaf 1`
        green=`tput setaf 2`
        reset=`tput sgr0`

        casks=( $(brew cask list) )

        for cask in ${casks[@]} ; do
            caskupgrade $cask
        done ;;
    "none")
        echo "No updates are done." ;;
    *)
        caskupgrade $cask ;;
esac
