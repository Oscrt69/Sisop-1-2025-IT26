hash() {
    echo -n "$1SALT" | sha256sum | awk '{print $1}'
}
read -p "Email: " email
read -sp "Password: " password
echo

hashed=$(hash "$password")
if awk -F',' -v e="$email" -v p="$password" '$1 == e && $3 == p' ./data/player.csv 
then
    echo "Login berhasil."
    ./scripts/manager.sh

else
    echo "Email atau password salah."
    exit 1
fi
