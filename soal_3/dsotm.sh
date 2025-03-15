#!/bin/bash

# Membersihkan terminal sebelum menjalankan program
clear

# Fungsi Speak to Me: Menampilkan word of affirmation setiap detik
speak_to_me() {
    echo "Playing: Speak to Me 🎵"
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | awk -F'"' '{print $4}')
	color=$((31 + RANDOM % 7))
        echo -e "\033[${color}m$affirmation\033[0m"
        sleep 1
    done
}

# Fungsi On the Run: Progress bar dengan interval random
on_the_run() {
    echo "Playing: On the Run 🚀"
    width=$(tput cols)  # Lebar terminal
    width=$((width - 10))  # Sisakan ruang untuk persen
    progress=0

    while [ $progress -le 100 ]; do
        bar=$(printf "%-${width}s" "#" | tr ' ' '#')
        printf "\r[%-${width}s] %3d%%" "${bar:0:$((progress * width / 100))}" "$progress"
        progress=$((progress + RANDOM % 5 + 1))
        sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    done
    echo -e "\nFinished!"
}

# Fungsi Time: Menampilkan live clock
time_display() {
    echo "Playing: Time ⏳"
    while true; do
        clear
        date +"⌚ %Y-%m-%d %H:%M:%S"
        sleep 1
    done
}

# Fungsi Money: Matrix efek dengan simbol mata uang
money() {
    echo "Playing: Money 💰"
    symbols=("¥" "€" "$" "£" "₹" "₿" "₩" "¢" "₣")
    cols=$(tput cols)
    lines=$(tput lines)
    tput civis  # Sembunyikan kursor

    trap "tput cnorm; exit" SIGINT SIGTERM

    while true; do
        row=$((RANDOM % lines))
        col=$((RANDOM % cols))
        symbol=${symbols[RANDOM % ${#symbols[@]}]}
	color=$((31 + RANDOM % 7))
        tput cup "$row" "$col"
        echo -ne "\033[${color}m$symbol\033[0m"
        sleep 0.05
    done
}

# Fungsi Brain Damage: Menampilkan pro
brain_damage() {
    while true; do
        clear
               echo -e "\e[38;5;214m$(date +'%H:%M:%S') | Load Average: $(cat /proc/loadavg | awk '{print $1, $2, $3}')\e[0m"

               echo -e "\e[1;36mPID     USER       PR   NI   %CPU  %MEM     VSZ    RSS   STAT   START          TIME     COMMAND\e[0m"

       
        ps -eo pid,user,pri,nice,%cpu,%mem,vsz,rss,stat,lstart,time,cmd --sort=-%cpu --width 300 | head -n 15 | awk '
        NR>1 {
            cmd = ""
            for (i=12; i<=NF; i++) cmd = cmd $i " " 
            printf "\033[38;5;202m%-7s\033[0m \033[38;5;45m%-10s\033[0m \033[38;5;33m%-4s\033[0m \033[38;5;226m%-4s\033[0m \033[38;5;196m%-5s\033[0m \033[38;5;46m%-5s\033[0m \033[38;5;220m%-7s\033[0m \033[38;5;81m%-6s\033[0m \033[38;5;227m%-6s\033[0m \033[38;5;129m%-14s\033[0m \033[38;5;208m%-8s\033[0m \033[38;5;33m%s\033[0m\n",
            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10" "$11, $12, cmd
        }'

        sleep 1
    done
}

# Parse argument untuk track yang dipilih
if [[ "$1" == --play=* ]]; then
    track="${1#--play=}"
    case "$track" in
        "Speak to Me") speak_to_me ;;
        "On the Run") on_the_run ;;
        "Time") time_display ;;
        "Money") money ;;
        "Brain Damage") brain_damage ;;
        *) echo "Track not found: $track" ;;
    esac
else
    echo "Usage: ./dsotm.sh --play=\"<Track>\""
fi
