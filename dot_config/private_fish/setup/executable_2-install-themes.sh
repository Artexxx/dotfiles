#!/bin/fish
#set -e
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo
tput setaf 3
echo "################################################################"
echo "################### Installing the themes"
echo "################################################################"
tput sgr0
echo

echo "We assume you have installed these packages"
echo "sudo pacman -S fish arcolinux-fish-git"
echo
echo "We assume you are now on fish and have omf installed"
echo

omf install lambda
omf install bobthefish

echo
tput setaf 3
echo "################################################################"
echo "################### Themes installed"
echo "################################################################"
tput sgr0
echo
