while true; do
    echo "1. Register"
    echo "2. Login"
    echo "3. Exit"
    read -p "Pilih opsi: " choice

    case $choice in
        1)
            ./register.sh
            ;;
        2)
            ./login.sh
            ;;
        3)
            exit 0
            ;;
        *)
            echo "Opsi tidak valid."
            ;;
    esac
done
