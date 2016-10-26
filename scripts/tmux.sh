#!/bin/bash

case "$1" in
    -mail)
        echo " ?"
        ;;
    -cpu)
        echo -n " "
        top -bn2 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f", prefix, 100 - v }'
        echo "%"
        ;;
    -mem)
        echo -n " "
        free | awk '/Mem/{print $2} /buffers\/cache/{print $3}' | paste -s | awk '{printf("%.1f", $2/$1*100)}'
        echo "%"
        ;;
    -num)
        case "$2" in
            0) echo "⁰" ;;
            1) echo "¹" ;;
            2) echo "²" ;;
            3) echo "³" ;;
            4) echo "⁴" ;;
            5) echo "⁵" ;;
            6) echo "⁶" ;;
            7) echo "⁷" ;;
            8) echo "⁸" ;;
            9) echo "⁹" ;;
            10) echo "¹⁰" ;;
            11) echo "¹¹" ;;
            12) echo "¹²" ;;
            13) echo "¹³" ;;
            14) echo "¹⁴" ;;
            15) echo "¹⁵" ;;
            16) echo "¹⁶" ;;
            17) echo "¹⁷" ;;
            18) echo "¹⁸" ;;
            19) echo "¹⁹" ;;
            *) echo "[$2]" ;;
        esac
        ;;
    -cmd)
        case "$2" in
            youtube-viewer|youtube-dl) echo "" ;;
            ssh|scp)                   echo "" ;;
            dmesg|journalctl)          echo "" ;;
            gdb|coredumpctl)           echo "" ;;
            git|gitsh)                 echo "" ;;
            mutt)                      echo "" ;;
            mpv|gnome-mpv|ffmpeg)      echo "" ;;
            parted|fdisk|gdisk)        echo "" ;;
            steel|kpcli)               echo "" ;;
            rtv)                       echo "" ;;
            ranger)                    echo "" ;;
            less|more)                 echo "" ;;
            virsh)                     echo "" ;;
            irssi|WeeChat)             echo "" ;;
            htop|top|glances)          echo "" ;;
            vi|vim|nvim)               echo "" ;;
            man)                       echo "" ;;
            zsh)                       echo "" ;;
            *)                         echo "" ;;
        esac
        ;;
esac
