while true; do
    echo "1. Add CPU - Core Monitor to Crontab"   
    echo "2. Add RAM Fragment Monitor to Crontab"
    echo "3. Remove CPU - Core Monitor from Crontab"
    echo "4. Remove RAM Fragment Monitor from Crontab"
    echo "5. View All Scheduled Monitoring Jobs"
    echo "6. Exit"
    read -p "Pilih opsi: " choice

    case $choice in
        1)
            ./scripts/core_monitor.sh            
            ;;
        2)
            ./scripts/frag_monitor.sh
            ;;
        3)
            truncate -s 0 ./logs/core.log
            echo "CPU removed"
            ;;
        4)
            truncate -s ./logs/fragment.log
            echo "RAM removed"
            ;;
        5)
            echo "1. Core Monitor (core.log)"
            echo "2. Fragment Monitor (fragment.log)"
            read -p "Pilih opsi: " log_choice

            if [ "$log_choice" -eq "1" ]; then
                cat logs/core.log
            elif [ "$log_choice" -eq "2" ]; then
                cat logs/fragment.log
            else
                echo "Tidak  valid."
            fi
            ;;
        6)
            exit 0
            ;;
        *)
            echo "Tidak Valid"
            ;;
    esac
done
