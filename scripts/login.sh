#!/bin/bash

printf "
        ⢸⣦⡈⠻⣿⣿⣿⣶⣄          ⣸ ⣯ ⣫ ⣫  ⣵ ⣟ ⣏ ⣿ ⣯ ⣟
        ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣷⣄
  ⣀⣀⣀⣀⣀⣀⣼⣿⣿⣿⣿ ⠈⠻⣿⣿⣿⣷⣄        `cat /etc/fedora-release | awk '{printf "%s %s", $1, $3}'`
  ⠈⠻⣿⣿⣿⣿⣿⡿⠿⠛⠁   ⠈⠻⢿⣿⣿⣷⣄     `df -h | grep root | awk '{print $4}' | tr -d '\n'`   `df -h | grep home | awk '{print $4}' | tr -d '\n'`   `free -m | grep "Mem" | awk '{printf "%.1fG", $7/1024}'`   `sensors | grep CPU | awk '{print $2}' | sed 's/+//' | tr -d '\n'`  辰`cat /proc/loadavg | awk '{printf "%s %s %s", $1, $2, $3}'`

" | lolcat --truecolor --seed=22 --spread=6
