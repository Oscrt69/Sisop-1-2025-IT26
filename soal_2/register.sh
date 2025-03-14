validate_email() {
    if [[ "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]
    then
        return 0
    else
        return 1
    fi
}

validate_password() {
    if [[ "${#1}" -ge 8 && "$1" =~ [A-Z] && "$1" =~ [a-z] && "$1" =~ [0-9] ]]
    then
        return 0
    else
        return 1
    fi
}

hash() {
    echo -n "$1SALT" | sha256sum | awk '{print $1}'
}

read -p "Email: " email
read -p "Username: " username
read -sp "Password: " password
echo

if ! validate_email "$email" 
then
    echo "Email tidak valid."
    exit 1
fi

if ! validate_password "$password"
then
    echo "Password tidak valid. Harus memiliki minimal 8 karakter, satu huruf besar, satu huruf kecil, dan satu angka."
    exit 1
fi

if grep -q "^$email," ./data/player.csv 
then
    echo "Email sudah terdaftar."
    exit 1
fi

hashed=$(hash "$password")
echo "$email,$username,$hashed" >> ./data/player.csv
echo "Registrasi berhasil."
