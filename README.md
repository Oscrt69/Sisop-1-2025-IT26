# Soal Shift Sisop Modul 1
Anggota kelompok: <br />
Azaria Raissa Maulidinnisa 5027241043 <br />
Oscaryavat Viryavan 5027241053 <br />
Naufal Ardhana 5027241118 <br />

## soal no 1
### 1.1 `wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv` 
Command ini untuk mendownload file csv dengan output file bernama reading_data.csv.

### 1.2 kode
```
echo "Pilih tugas yang ingin dijalankan:"
echo "1. Menghitung jumlah buku yang dibaca oleh Chris Hemsworth"
echo "2. Menghitung rata-rata durasi membaca dengan Tablet"
echo "3. Mencari pembaca dengan rating tertinggi"
echo "4. Mencari genre paling populer setelah 31 Desember 2023"
read -p "Masukkan Pilihan" input

if [ "$input" == "1" ]
then
   sumbook=$(awk -F',' '$2 == "Chris Hemsworth" {count++} END {print count}' reading_data.csv)
   echo "Chris Hemsworth membaca $sumbook buku."

elif [ "$input" == "2" ]
then
     declare -A durasi perangkat
     while IFS=',' read -r _ _ _ _ _ duration _  device _;
          do
           durasi["Tablet"]=$((${durasi["Tablet"]} + duration))
           perangkat["Tablet"]=$((${perangkat["Tablet"]} + 1))
     done < reading_data.csv

     if [ -n "${durasi[Tablet]}" ]
     then
        avg=$(echo "scale=2; ${durasi[Tablet]} / ${perangkat[Tablet]}" | bc)
        echo "Rata-rata durasi membaca dengan Tablet adalah $avg menit."
fi

elif [ "$input" == "3" ]
    then
     best=$(awk -F',' 'NR>1 {if ($7 > max) {max=$7; name=$2; book=$3; rating=$7}} END {print name " - " book " - " rating}' reading_ding_data.csv
     echo "Pembaca dengan rating tertinggi: $best"

elif [ "$input" == "4" ]
then
   declare -A genre_count
   while IFS=',' read -r _  _  _ genre _ date  _ _ _;
   do
    if [[ "$date" > "2023-12-31" ]]
    then
        genre_count[$genre]=$((${genre_count[$genre]:-0} + 1))
    fi
done < reading_data.csv

max_genre=""
num=0
for i  in "${!genre_count[@]}"; do
    if (( genre_count[$i] > num ))
    then
        num=${genre_count[$i]}
        max_genre=$i
    fi
done

    echo "Genre paling populer setelah 2023 adalah $max_genre dengan $num buku."

else
    echo "Pilihan tidak valdi"
fi
```
Secara keseluruhan, kode ini menggunakan if-else sesuai peraturan yang diberikan.
### 1a
`sumbook=$(awk -F',' '$2 == "Chris Hemsworth" {count++} END {print count}' reading_data.csv)` <br>
Menunjukkan bahwa dari file csv tersebut akan dicari di kolom 2 yaitu nama penyanyi yang setiap tabelnya terpisah oleh koma, dan
`{count++}` akan menambahkan count setiap kali ditemukan nama "Chris Hemsworth" pada kolom ke-2.
### Output 1a.
![hasil](https://github.com/user-attachments/assets/11280e08-4a97-4a40-9221-f8c26a6d7807)

### 1b
`while IFS=',' read -r _ _ _ _ _ duration _ device _; do` <br>
`IFS=',':` Internal Field Separator (IFS) sebagai koma (,), sehingga read akan memisahkan setiap kolom berdasarkan koma. <br>
`read -r _ _ _ _ _ duration _ device _; do` mengabaikan semua kolom kecuali duration dan device. <br>
`avg=$(echo "scale=2; ${durasi[Tablet]} / ${perangkat[Tablet]}"` adalah
variabel avg berisi pembagian antara jumlah durasi tablet dengan total frekuensi tablet yang muncul.
### Output 1b.
![hasil2](https://github.com/user-attachments/assets/464d2158-2e1c-4fa0-a8d0-d396ac24083b)

### 1c
`$(awk -F',' 'NR>1 {if ($7 > max) {max=$7; name=$2; book=$3; rating=$7}}` <br>
jika kolom ke-7 > max maka : <br>
Simpan rating tertinggi di kolom ke-7. <br>
Simpan nama pembaca di kolom ke-2. <br>
Simpan nama buku yang dibaca di kolom ke-3. <br>
Simpan rating tertinggi di kolom ke-7. <br>

`END {print name " - " book " - " rating}'` <br>
Akan mengeprint dengan format nama pembaca - judul buku yang dibaca - rating

### Output 1c.
![hasil3](https://github.com/user-attachments/assets/32ea5bc1-411d-4750-a5ef-79b441f5d6ed)

### 1d

`if [[ "$date" > "2023-12-31" ]]
    then
        genre_count[$genre]=$((${genre_count[$genre]:-0} + 1))
    fi`

Operasi berjalan jika pada kolom Read_Date lebih dari 31 Desember 2023. <br>

`(${genre_count[$genre]:-0} + 1))`
Jika genre_count[$genre] belum ada, maka dianggap bernilai nol (0) untuk menghindari error. <br>

`for i  in "${!genre_count[@]}"; do` 
Mengambil semua key (nama genre) dalam array asosiatif genre_count. Loop ini akan memeriksa semua genre yang ada. <br>

`if (( genre_count[$i] > num ))
    num=${genre_count[$i]}`
Mengecek apakah jumlah buku untuk genre $i lebih besar dari jumlah tertinggi yang sudah ditemukan sejauh ini. Jika genre saat ini memiliki jumlah yang lebih besar, maka num diperbarui dengan jumlah buku dari genre tersebut.

### Output 1d

![hasil4](https://github.com/user-attachments/assets/61165a03-05c8-42b0-b484-4a60b7f413d3)

# soal no 2

### Kerangka Nomor 2
![krgkg](https://github.com/user-attachments/assets/3da30948-9d44-4194-a670-b9d27858d036) <br>
Ini adalah struktur file dan directory untuk nomor 2 sesuai dengan aturan yang ada. Tulisan berwarna biru menandakan direktori, tulisan berwarna putih menandakan file yang belum diubah permissionnya, tulisan berwarna hijau menandakan file yang sudah diubah permissionnya dengan cara `chmod +x (nama_file).sh`

### 1.1 Register.sh dan login.sh
Membuat register.sh 

```validate_email() {
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
```

`^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]`
ini adalah format email yang valid, contoh email yang valid : oscar10@gmail.com <br>

`"${#1}" -ge 8 && "$1" =~ [A-Z] && "$1" =~ [a-z] && "$1" =~ [0-9]`
ini adalah format password yang sesuai aturan dimana setidaknya: <br>
- Delapan karakter <br>
- Satu uruf besar <br>
- Satu huruf kecil <br>
- Satu angka <br>


Membuat login.sh 

```hash() {
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
```

    `echo -n "$1SALT" | sha256sum | awk '{print $1}'

Password di hash dengan algoritma SHA 256 <br>
`$1` merupakan parameter pertama yang dikirim ke fungsi hash(). <br>
`SALT` adalah String tambahan (garam) yang digabungkan dengan input untuk meningkatkan keamanan hash. <br>

```
if awk -F',' -v e="$email" -v p="$password" '$1 == e && $3 == p' ./data/player.csv
then
    echo "Login berhasil."
    ./scripts/manager.sh
```
Jika user mengisi email dan password yang sesuai dengan database (`./data/player.csv`), maka user akan dibawa ke `./scripts/manager.sh` <br>
Berikut adalah tampilan database ketika dibuka <br>
![db](https://github.com/user-attachments/assets/b6e43dd8-d2d8-4fff-9b3a-163bcf390ba9)

### 1.2 Core_monitor.sh
```
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
cpu_model=$(lscpu | grep "Model name" | cut -d ':' -f 2 | xargs)
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] - Core Usage [$cpu_usage%] - Terminal Model [$cpu_model]" >> ./logs/core.log
```
`top -bn1` menjalankan perintah top dalam mode batch  hanya satu kali `n1`. <br>
`sed "s/.*, *\([0-9.]*\)%* id.*/\1/"` mengambil angka idle CPU (CPU yang tidak terpakai). <br>
`awk '{print 100 - $1}'` menghitung persentase CPU yang digunakan <br>

`lscpu` menampilkan informasi CPU. <br>
`cut -d ':' -f 2` memisahkan teks berdasarkan : dan mengambil nama model CPU. <br>
`xargs` menghapus spasi berlebih di awal dan akhir teks. <br>
Contoh Output: <br>
[2025-03-15 15:14:37] - Core Usage [0.6%] - Terminal Model [AMD Ryzen 9 8945HS w/ Radeon 780M Graphics] <br>
`>> ./logs/core.log` menyimpan teks dalam file core.log<br>

### 1.3 Frag_monitor.sh

```
ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
ram_total=$(free -m | grep Mem | awk '{print $2}')
ram_used=$(free -m | grep Mem | awk '{print $3}')
ram_available=$(free -m | grep Mem | awk '{print $7}')
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$timestamp] - Fragment Usage [$ram_usage%] - Fragment Count [$ram_used MB] - Details [Total: $ram_total MB, Available: $ram_available MB]" >> ./logs/fragment.log
```
`free -m` Menampilkan informasi RAM dalam megabyte (MB)
`grep Mem` Mencari informasi RAM
`$2`  Total RAM.
`$3` RAM yang sedang digunakan.
`$7` Mengambil jumlah RAM yang tersedia.

### 1.4 Manager.sh

```
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
            echo "Tidak valid"
            ;;
    esac
done
```
`truncate -s 0` menghapus teks yang tersimpan di log.

### 1.5 terminal.sh

```
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
```
# soal no 3
### 3.1 Speak To Me
```
speak_to_me() {
    echo "Playing: Speak to Me 🎵"
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | awk -F'"' '{print $4}')
	color=$((31 + RANDOM % 7))
        echo -e "\033[${color}m$affirmation\033[0m"
        sleep 1
    done
}
   ```
Kode diatas memulai loop untuk `(while true)` agar script terus berjalan. Sedangkan `curl -s` mengambil words of affirmation dari situs https://www.affirmations.dev. Selanjutnya `color=$((31 + RANDOM % 7))` akan menampilkan text dengan pemilihan 7 warna random. Untuk `awk -F'"' '{print $4}'` digunakan mengekstrak teks affirmation dari JSON yang diterima. `echo "$affirmation"` digunakan untuk mencetak kata-kata motivasi ke layar dan `sleep 1` digunakan untuk memberikan rentang waktu 1 detik.

### Output Speak to Me
![image](https://github.com/user-attachments/assets/bff2e177-bf09-442f-b98e-8baefa4585cd)

### 3.2 On The Run
```
on_the_run() {
    echo "Playing: On the Run 🚀"
    width=$(tput cols) 
    width=$((width - 10))  
    progress=0

    while [ $progress -le 100 ]; do
        bar=$(printf "%-${width}s" "#" | tr ' ' '#')
        printf "\r[%-${width}s] %3d%%" "${bar:0:$((progress * width / 100))}" "$progress"
        progress=$((progress + RANDOM % 5 + 1))
        sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    done
    echo -e "\nFinished!"
```
`width=$(tput cols)` dan `width=$((width - 10))` berfungsi untuk mendapatkan lebar terminal dan mengurangi 10 kolom untuk text persentase. Kemudian bar di inisialisasi muali dari 0% dan `while [ $progress -le 100 ]; do` kode tersebut akan membuat loop mencapai 100%. Selanjutnya string '#' akan dibuat dengan`bar=$(printf "%-${width}s" "#" | tr ' ' '#')`. printf `printf "\r[%-${width}s] %3d%%" "${bar:0:$((progress * width / 100))}" "$progress"` akan membuat loop string dalam 1 line. `progress=$((progress + RANDOM % 5 + 1))` akan menambahkan progres acak mulai dari 1-5 di setiap iterasi loop. Selanjutnya `sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')` akan membuat delay sleep dari rentang 0,1-1 detik sehingga progres bar lebih natural.

### Output On the Run
![On the Run](https://github.com/user-attachments/assets/338c943d-5e82-47d0-ae13-d2bfd530683d)

### 3.3 Time
```
time_display() {
    echo "Playing: Time ⏳"
    while true; do
        clear
        date +"⌚ %Y-%m-%d %H:%M:%S"
        sleep 1
    done
```
Perintah `date +"⌚ %Y-%m-%d %H:%M:%S"` akan menampilkan waktu dengan format Year-Month-Day Hour-Minute-Second. dan `sleep 1` akan memberikan delay 1 detik sehingga akan terlihat seperti jam digital.

### Output Time
![Time](https://github.com/user-attachments/assets/a321ef18-be1c-43e4-991f-f6b7e6856d41)

### 3.4 Brain Damage
```
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
```
`echo -e "\e[38;5;214m$(date +'%H:%M:%S') | Load Average: $(cat /proc/loadavg | awk '{print $1, $2, $3}')\e[0m""` akan menampilkan waktu jam digital berwarna coklat dan beban CPU dalam 1, 5, 15 menit terakhir. Selanjutnya `echo -e "\e[1;36mPID     USER       PR   NI   %CPU  %MEM     VSZ    RSS   STAT   START     TIME     COMMAND\e[0m"` berfungsi untuk mencetak header dari sebuah tabel dengan warna cyan yang menampilkan list task manager yang dibutuhkan. `ps -eo pid,user,pri,nice,%cpu,%mem,vsz,rss,stat,lstart,time,cmd --sort=-%cpu --width 300 | head -n 15` akan menampilkan daftar proses pada setiap kolomnya dengan `--sort=-%cpu` mengurutkan berdasar CPU tertinggi dan `head -n 15` agar menampilkan 15 proses teratas. Selanjutnya command printf berfungsi memformat output dengan warna yang berbeda agar lebih mudah dibaca. `sleep 1` digunakan untuk memberikan jeda 1 detik sebelum mencetak ulang proses.

### Output Brain Damage
![image](https://github.com/user-attachments/assets/1a33870a-fe70-41ac-87c6-2f565f0da91c)

### 3.5 Money
```
money() {
    echo "Playing: Money 💰"
    symbols=("¥" "€" "$" "£" "₹" "₿" "₩" "¢" "₣")
    cols=$(tput cols)
    lines=$(tput lines)
    tput civis  

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
```
`symbols=("¥" "€" "$" "£" "₹" "₿" "₩" "¢" "₣")` merupakan array yang berisi simbol mata uanh yang nantinya akan ditampilkan secara acak. `tput civis` digunakan untuk menyembunyikan kursor agar terlihat lebih realistik. Selanjutnya `trap "tput cnorm; exit" SIGINT SIGTERM` akan menghentikan proses jika menekan ctrl + C, dimana kursor dikembalikan ke keadaan `tput cnorm` sebelum keluar. Di perintah `while true; do` command akan terus menampilkan simbol di random line dan collum. Pada command `symbol=${symbols[RANDOM % ${#symbols[@]}]}` berfungsi untuk memilih simbol acak di array symbols. Dan `color=$((31 + RANDOM % 7))` akan mencetak simbol dengan posisi 7 warna yang acak. Serta `tput cup "$row" "$col"` akan memunculkan kursor di posisi yang acak. Dan terakhir `sleep 0,05` memberikan delay sebelum mencetak simbol.

### Ouput Money
![image](https://github.com/user-attachments/assets/6251ea51-4eb5-4d0a-9d9e-643d03f8ac65)

# soal no 4
### 4.1 Download file csv
``` wget "https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download" -O pokemon_usage.csv ```
Command di atas akan mendownload file csv dengan output nama file pokemon_usage.csv.

### 4.2 Membuat script 'pokemon_analysis.sh'
Menggunakan command ``` nano pokemon_analysis.sh ``` untuk membuat script 'pokemon_analysis.sh'. Setelah masuk ke editor **nano**, ketik kode berikut ke dalam file:
```
#!/bin/bash

data_file="pokemon_usage.csv"

if [ ! -f "$data_file" ]; then
        echo "Error: File $data_file not found."
        exit 1
fi

echo "Script pokemon_analysis.sh ready to use."
```
Simpan file dengan menekan **CTRL + X**, lalu tekan **Y** dan **Enter** untuk menyimpan perubahan. Beri izin eksekusi agar dapat dijalankan dengan 
``` chmod +x pokemon_analysis.sh ``` dan jalankan script dengan command ``` ./pokemon_analysis.sh ```.
Kode di atas akan mengecek apakah file 'pokemon_usage.csv' ada. Jika file tidak ditemukan, maka akan muncul pesan error dan eksekusi script akan dihentikan. 

### Output jika script siap
![script_bener](https://github.com/user-attachments/assets/a17683db-b139-4f5e-9c51-fc304a40c65a)


### 4a. Menampilkan nama Pokemon dengan Usage% dan RawUsage paling tinggi
```
if [ "$2" = "--info" ]; then
        if [ ! -s "$data_file" ]; then
                echo "Error: $data_file does not contain valid data"
                echo " Use -h or --help for more information."
                exit 1
        fi

        echo "Meta Report: Gen 9 OverUsed"

        highest_usage=$(tail -n +2 "$data_file" | sort -t, -k2 -nr | head -n 1 | cut -d, -f1,2)
        highest_raw=$(tail -n +2 "$data_file" | sort -t, -k3 -nr | head -n 1 | cut -d, -f1,3)

        usage_pokemon=$(echo "$highest_usage" | cut -d, -f1)
        usage_value=$(echo "$highest_usage" | cut -d, -f2)

        raw_pokemon=$(echo "$highest_raw" | cut -d, -f1)
        raw_value=$(echo "$highest_raw" | cut -d, -f2)

        echo "Scariest Opponent: $usage_pokemon is terrorizing the meta at $usage_value usage!"
        echo "Most Picked Pokemon: $raw_pokemon with a crazy $raw_value uses!"
        echo "Time to build a GOAT-strategy!"

        exit 0
fi
```
``` if [ "$2" = "--info" ] ``` Mengecek apakah argumen kedua dalam command yang diberikan adalah '--info'. 
``` if [ ! -s "$data_file" ] ``` Mengecek apakah file berisi data atau kosong, jika file kosong maka akan muncul pesan error dan petunjuk untuk membuka help.

``` highest_usage=$(tail -n +2 "$data_file" | sort -t, -k2 -nr | head -n 1 | cut -d, -f1,2) ``` Mengurutkan Usage Pokemon dari yang paling besar. 

``` tail -n +2 "$data_file" ``` Melewati baris pertama pada file pokemon_usage.sh dan mulai membaca file dari baris kedua.

``` sort -t, -k2 -nr ``` Mengurutkan ```-k2``` kolom kedua (usage) dari yang terbesar, ```-t,``` menunjukkan delimiter atau pemisah kolom adalah **,**. ```-n``` menganggap yang disorting adalah angka, ```-r``` untuk mengurutkan dari terbesar ke terkecil. 

Setelah diurutkan, ```head -n 1``` mengambil data paling atas, kemudian ```cut -d, -f1,2``` mengambil hanya nama pokemon (kolom 1) dan angka usage (kolom 2).

``` highest_raw=$(tail -n +2 "$data_file" | sort -t, -k3 -nr | head -n 1 | cut -d, -f1,3)``` Mengurutkan Raw Pokemon dari yang paling besar, untuk keseluruhan kode sama hanya diganti untuk nomor kolom menjadi ```-k3``` karena Raw berada di kolom 3. 

``` usage_pokemon=$(echo "$highest_usage" | cut -d, -f1)``` ```usage_value=$(echo "$highest_usage" | cut -d, -f2)``` Memisahkan data Pokemon dan angkanya. 
```cut -d, -f1``` Mengambil kolom 1 yang berisi nama Pokemon dari sorting 'highest_usage'.
```cut -d, -f2``` Mengambil kolom 2 yang berisi angka Usage dari sorting 'highest_usage'. Kode sama untuk Raw Pokemon yang diambil dari sorting 'raw_usage'.

### Output untuk --info
![terminal_info](https://github.com/user-attachments/assets/547f0a54-8084-4ad2-ac4a-9de6b36208d3) 

### 4b. Mengurutkan Pokemon berdasarkan data kolom
```
file="$1"
option="$2"
value="$3"

declare -A COLUMNS=(
        ["name"]=1
        ["usage"]=2
        ["raw"]=3
        ["hp"]=6
        ["atk"]=7
        ["def"]=8
        ["spatk"]=9
        ["spdef"]=10
        ["speed"]=11
)
if [ -z "${COLUMNS[$value]}" ]; then
        echo "Error: Invalid sort method '$value'."
        echo "Use -h or --help for more information."
        exit 1
fi

head -n 1 "$file"

if [ "$value" == "name" ]; then
        tail -n +2 "$file" | sort -t, -k${COLUMNS[$value]}
else
        tail -n +2 "$file" | sort -t, -k${COLUMNS[$value]} -n -r
        exit 0
fi
```
```file="$1"``` Mendeklarasi argumen 1 adalah nama file. ```option="$2"``` Mendeklarasi argumen 2 untuk pilihan eksekusi. ```value="$3"``` Mendeklarasi argumen 3 adalah nilai dari option. 

```declare -A COLUMNS``` Mendeklarasikan array asosiatif yang digunakan untuk menyimpan indeks kolom file pokemon_usage.csv. 

```if [ -z "${COLUMNS[$value]}" ]``` Mengecek apakah input dari user valid atau tidak saat memilih kolom. Jika kolom tidak ada, akan muncul pesan error.

```head -n 1 "$file"``` Menampilkan baris 1 dari file pokemon_usage.csv.

```if [ "$value" == "name" ]``` Mengecek apakah kolom yang akan disorting adalah kolom **name**. 
```tail -n +2 "$file"``` Melewati baris 1 dan mulai dari baris 2. 
```sort -t, -k${COLUMNS[$value]}``` Mengurutkan kolom name karena input yang dimasukkan adalah name.
```sort -t, -k${COLUMNS[$value]} -n -r``` Mengurutkan data secara numerik dan descending. 

### Output untuk --sort (method)
![sort term bener](https://github.com/user-attachments/assets/56bc0192-22e3-471b-a383-86b9901b648c)
![sort nama](https://github.com/user-attachments/assets/8c03f5d4-0686-4f54-9ceb-fb19666b2e8c)

### 4c. Mencari nama pokemon tertentu
```
if [ "$option" = "--grep" ] || [ "$option" = "--filter" ]; then
        if [ -z "$value" ]; then
                echo "Error: no search keyword provided."
                echo "Use -h or --help for more information."
                exit 1
        fi

        head -n 1 "$file"
        tail -n +2 "$file" | grep -i -w "$value" | sort -t, -k2 -n -r
        exit 0
fi
```
```if [ "$option" = "--grep" ]``` Mengecek apakah input argumen option adalah **--grep**.
```if [ -z "$value" ]``` Mengecek apakah variabel kosong, jika kosong maka ``if`` bernilai **true** dan menampilkan pesan error.
```head -n 1 "$file"``` Menampilkan baris 1 file pokemon_usage.csv.
```grep -i -w "$value"``` Mencari variabel ```$value``` dalam file dengan ``-i`` ignore case dan ```-w``` yang hanya mencocokkan kata utuh, bukan bagian kata lain.
```sort -t, -k2 -n -r``` Mengurutkan kolom 2 secara numerik dan descending.

### Output untuk --grep (name)
![grep term bener](https://github.com/user-attachments/assets/f8d75374-e8db-4e70-bddf-402adf712e52)

### 4d. Mencari Pokemon berdasarkan filter nama type
Kode untuk filter sama dengan kode grep di atas. 
### Output untuk --filter (type)
![filter term bener](https://github.com/user-attachments/assets/92670edc-29e1-4b8b-81ce-d86e785ee36b)

### 4e. Error Handling 
```
if [ $# -lt 3 ]; then
        echo "Error: no $2 option provided."
        echo "Use -h or --help for more information."
        exit 1
fi
```
```if [ $# -lt 3 ]``` Mengecek apakah input argumen kurang dari 3, jika kurang dari 3 maka akan muncul pesan error dan petunjuk untuk menggunakan help.
### Output jika input tidak sesuai
![eror handling](https://github.com/user-attachments/assets/356c85c5-713b-48e1-8aff-48cdaa1d8d9c)

### 4f. Help Screen 
```
if [ "$2" = "-h" ] || [ "$2" = "--help" ]; then
echo "                         *******************  "
echo "                      ************************* "
echo "                    ***************************** "
echo "                  ********************************* "
echo "                 ************************************ "
echo "               **************############************** "
echo "             ***************#            #*************** "
echo "             **************#    ######    #************** "
echo "             ##############    #      #    ############## "
echo "             #############    #        #    ############# "
echo "             ##############    #      #    ############## "
echo "             **************#    ######    #************** "
echo "             ***************#            #*************** "
echo "               **************############************** "
echo "                 ************************************ "
echo "                  ********************************** "
echo "                    ******************************  "
echo "                      ************************** "
echo "                        ********************* "

echo ""
echo "Usage: ./pokemon_analysis.sh <file_name> [options]"
echo ""
echo "Options:"
echo " -h, --help           Show this help message."
echo " -i, --info           Show the highest adjusted and raw usage."
echo " -s, --sort <method>  Sort data by a specific column."
echo "     name             Sort by Pokemon name."
echo "     usage            Sort by Adjusted Usage."
echo "     raw              Sort by Raw Usage."
echo "     hp               Sort by HP."
echo "     atk              Sort by Attack."
echo "     def              Sort by Defense."
echo "     spatk            Sort by Special Attack."
echo "     spdef            Sort by Special Defense."
echo "     speed            Sort by Speed."
echo " -g, --grep <name>    Search for a specific Pokemon sorted by usage."
echo " -f, --filter <type>  Filter by type of Pokemon sorted by usage."

fi
```
```if [ "$2" = "-h" ] || [ "$2" = "--help" ]``` Mengecek apakah input argumen kedua adalah ```-h``` atau ```--help```. Jika iya, maka akan menampilakan help screen yang sudah dibuat. 
### Output helpscreen
![help term bener](https://github.com/user-attachments/assets/a49b8eef-7162-4da4-9e42-61a83eda122d)

# REVISI

 ## NO 1
```
echo "Pilih tugas yang ingin dijalankan:"
echo "1. Menghitung jumlah buku yang dibaca oleh Chris Hemsworth"
echo "2. Menghitung rata-rata durasi membaca dengan Tablet"
echo "3. Mencari pembaca dengan rating tertinggi"
echo "4. Mencari genre paling populer setelah 31 Desember 2023"
read -p "Masukkan Pilihan" input

if [ "$input" == "1" ]
then
   awk -F ',' 'NR > 1 && $2 == "Chris Hemsworth" {count++} END { print "Christ Hemsworth membaca", count, "buku."}' reading_data.csv

elif [ "$input" == "2" ]
then
     awk -F ',' 'NR > 1 && $8 == "Tablet" { sum += $6; count++ }
END { print "Rata-rata durasi membaca dengan Tablet adalah", sum/count, "menit." }' reading_data.csv

elif [ "$input" == "3" ]
    then
     awk -F ',' 'NR > 1 && $7 > max {max=$7; name=$2; book=$3 }
     END {print "Pembaca dengan raing tertinggi: " name "-"  book  "-" max}' reading_data.csv

elif [ "$input" == "4" ]
then
   awk -F ',' 'NR > 1 && $9 == "Asia" && $5 > "2023-12-31" { genre[$4]++ }
END {max = 0; for (i in genre) {if (genre[i] > max) {max = genre[i];common = i;}} print "Genre paling populer di Asia setelah 2023 adalah " common " dengan " max " buku."}' re>

else
    echo "Pilihan tidak valid"
fi
```
## NO 2

### register.sh

```
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
    echo "Password tidak valid. Harus memiliki minimal 8 karakter, satu huruf besar, >    exit 1
fi

if grep -q "^$email," ./data/player.csv
then
    echo "Email sudah terdaftar."
    exit 1
fi

hashed=$(hash "$password")
echo "$email,$username,$hashed" >> ./data/player.csv
echo "Registrasi berhasil."
```

### login.sh

```
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
```

### manager.sh

```
function CPU {
  if crontab -l | grep -q "core_monitor.sh"; then
    echo -e "Cpu is already monitored"
    return 1
  fi
  local script="$(pwd)/scripts/core_monitor.sh"
  local schedule='* * * * *'
  (crontab -l; echo "$schedule $script") | crontab - 2>/dev/null

  echo -e "Added Successfully"
}


function RAM {
  if crontab -l | grep -q "frag_monitor.sh"; then
    echo -e "Ram is already monitored"
    return 1
  fi
  local script="$(pwd)/scripts/frag_monitor.sh"
  local schedule='* * * * *'
  (crontab -l; echo "$schedule $script") | crontab - 2>/dev/null

  echo -e "Added Successfully"
}

function removeCPU {
  if ! crontab -l | grep -q "core_monitor.sh"; then
    echo -e "Cpu is not monitored yet"
    return 1
  fi
  crontab -l | grep -v "core_monitor.sh" | crontab -

  echo -e "Removed Successfully"
}

function removeRAM {
  if ! crontab -l | grep -q "frag_monitor.sh"; then
    echo -e "Ram is not monitored yet"
    return 1
  fi
  crontab -l | grep -v "frag_monitor.sh" | crontab -

  echo -e "Removed Successfully"
}

function viewCrontab {
  if [ -z "$(crontab -l)" ]; then
    echo "No scheduled monitoring jobs"
  else
    crontab -l
  fi
}

# Menu utama
while true; do
  username=$(echo $SESSION | cut -d ',' -f2)
  echo "1. Add CPU - Core Monitor to Crontab"
  echo "2. Add RAM Fragment Monitor to Crontab"
  echo "3. Remove CPU - Core Monitor from Crontab"
  echo "4. Remove RAM Fragment Monitor from Crontab"
  echo "5. View All Scheduled Monitoring Jobs"
  echo "6. Exit"
  read -p "Choose an option: " choice

  case $choice in
    1) CPU ;;
    2) RAM ;;
    3) removeCPU ;;
    4) removeRAM ;;
    5) viewCrontab ;;
    6) exit 0 ;;
    *) echo -e "Invalid!" ;;
  esac
done
```

### core_monitor.sh

```
DIR_PATH=$(realpath $(dirname $0))
LOG_DIR=$(realpath "$DIR_PATH/../logs")

if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

CPU_Load=$(top -bn2 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}' | awk 'NR==2 {print $0}' )
CPU_Type=$(lscpu | grep 'Model name' | awk -F': ' '{print $2}' | xargs)

echo "[$(date +'%Y-%m-%d %H:%M:%S')] - Core Usage [$CPU_Load] - Terminal Model [$CPU_Type]" >> "$LOG_DIR/core.log"
```

### frag_monitor.sh

```
DIR_PATH=$(realpath $(dirname $0))
LOG_DIR=$(realpath "$DIR_PATH/../logs")

if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

echo "[$(date "+%Y-%m-%d %H:%M:%S")] - Fragment Usage [$(awk '/MemFree/ {free=$2} /MemTotal/ {total=$2} END {print (1 - free/total) * 100}' /proc/meminfo)%] - Fragment Count [$(awk '/SReclaimable/ {print $2/1024}' /proc/meminfo) MB] - Details [Total: $(free -m | awk '/Mem:/ {print $2}') MB, Available: $(free -m | awk '/Mem:/ {print $7}') MB]" >> "$LOG_DIR/fragment.log"

```

### terminal.sh

```
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
```

## NO 4
### 4c. Mencari nama pokemon tertentu
```
if [ "$option" = "--grep" ]; then
        if [ -z "$value" ]; then
                echo "Error: no search keyword provided."
                echo "Use -h or --help for more information."
                exit 1
        fi

        head -n 1 "$data_file"
        tail -n +2 "$file" | awk -F, -v name="$3" 'BEGIN {IGNORECASE=1} $1 == name' | sort -t, -k2 -nr
        exit 0
fi
```
```awk -F, -v name="$3" 'BEGIN {IGNORECASE=1} $1 == name'``` digunakan untuk mencari hanya di kolom pertama yang menyimpan nama pokemon. 
```-F,``` pemisah dalam file menggunakan koma. ```-v name="$3"``` untuk mengambil argumen yang dimasukkan user. ```'BEGIN {IGNORECASE=1} $1 == name'``` untuk mencocokkan hanya dengan kolom pertama tanpa memperhatikan huruf besar atau kecil.

### Output revisi 4c.
![revisi grep](https://github.com/user-attachments/assets/09d11eb7-43fd-4fce-84e8-224f92e27b02)

### 4d. Mencari Pokemon berdasarkan filter nama type
```
if [ "$option" = "--filter" ]; then
        if [ -z "$value" ]; then
                echo "Error: no search keyword provided."
                echo "Use -h or --help for more information."
                exit 1
        fi

        result=$(tail -n +2 "$data_file" | awk -F, -v type="$3" 'BEGIN {IGNORECASE=1} NR > 1 && ($4 == type || $5 == type)')
        if [ -z "$result" ]; then
                echo "Error: no Pokemon found with type '$3'."
                exit 1
        fi

        head -n 1 "$data_file"
        echo "$result" | sort -t, -k2 -nr
        exit 0
fi
```
```awk -F, -v type="$3" 'BEGIN {IGNORECASE=1} NR > 1 && ($4 == type || $5 == type)``` digunakan hanya untuk mencari hanya di kolom 4 dan 5 yang menyimpan type pokemon. 
```NR > 1``` untuk mengabaikan header saat filter. ```($4 == type || $5 == type)``` hanya mencari di kolom 4 dan 5 yang berisi type pokemon. 

### Output revisi 4d. 
![revisi filter](https://github.com/user-attachments/assets/8ff2214e-baab-4593-bece-beda80cd0607)
Tidak dapat menampilkan ''weavile'' karena bukan type pokemon.

![revisi filter2](https://github.com/user-attachments/assets/314e0a19-b74c-419f-97fa-dcde89e5f8fe)


