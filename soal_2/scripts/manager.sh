while true; do
    echo "1. Add CPU - Core Monitor to Crontab"   
    echo "2. Add RAM Fragment Monitor to Crontab"
    echo "3. Remove CPU - Core Monitor to Crontab"
    echo "4. Remove RAM Fragment Monitor to Crontab"
    echo "5. View All Scheduled Monitoring Jobs"
    echo "6. Exit"
    read -p "Pilih opsi: " choice

    core(){
   ./scripts/core_monitor.sh
    }

    frag(){
   ./scripts/frag_monitor.sh
    }
 
    crontab() {
    ./logs
    }

    case $choice in
        1)
            core
            ;;
        2)
            frag
            ;;
        3)

            ;;
        4)

            ;;
        5)
            crontab
            ;;
        6)
            exit 0
            ;;
        *)
            echo "Tidak Valid"
            ;;
    esac
done
