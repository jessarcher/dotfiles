#!/bin/bash

os=`cat /etc/fedora-release | awk '{printf "%s %s", $1, $3}'`
rootAvail=`df -h --output=avail / | tail -n1 | tr -d ' \n'`
rootSize=`df -h --output=size / | tail -n1 | tr -d ' \n'`
memAvailable=`free -m | grep "Mem" | awk '{printf "%.1fG", $7/1000}'`
memTotal=`free -m | grep "Mem" | awk '{printf "%.fG", $2/1000}'`
cpuTemp=`sensors | grep CPU | awk '{print $2}' | sed 's/+//' | tr -d '\n'`
loadAvg=`cat /proc/loadavg | awk '{printf "%s %s %s", $1, $2, $3}'`

printf "
        ⢸⣦⡈⠻⣿⣿⣿⣶⣄          ⣸ ⣯ ⣫ ⣫  ⣵ ⣟ ⣏ ⣿ ⣯ ⣟
        ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣷⣄
  ⣀⣀⣀⣀⣀⣀⣼⣿⣿⣿⣿ ⠈⠻⣿⣿⣿⣷⣄        $os
  ⠈⠻⣿⣿⣿⣿⣿⡿⠿⠛⠁   ⠈⠻⢿⣿⣿⣷⣄     $rootAvail/$rootSize   $memAvailable/$memTotal   $cpuTemp  辰$loadAvg

" | lolcat --truecolor --seed=22 --spread=6
