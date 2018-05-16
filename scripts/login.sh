#!/bin/bash
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#printf $CYAN
printf '
                _________
               |\\\W#####M\
               |M\\\W#####M\
               |#M\\\W#####M\
               |##M\\\W#####M\
               A###M\\\W#####M\
      _______,a#####M|\W#####M\
      \W############W  \W#####M\
       \W##########W    \W#####M\
        `YW#####W7"      \W#####M\
           ¯¯¯¯¯          ¯¯¯¯¯¯¯¯
' | lolcat
echo
printf $GREEN
echo 'Greetings Jess! Here is a vimtip for you:'
echo
fortune vimtips
echo
printf $NC
