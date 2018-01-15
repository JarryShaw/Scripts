#!/bin/bash


################################################################################
# Log Homebrew packages uninstallation.
################################################################################


case $1 in
    "all")
        brew list ;;
    *)
        echo $1
        brew deps $1 ;;
esac