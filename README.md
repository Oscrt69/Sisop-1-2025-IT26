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
![hasil](https://github.com/user-attachments/assets/2ed0e40f-2ef7-46f4-aa99-607fc08a6076)
### 1b
`while IFS=',' read -r _ _ _ _ _ duration _ device _; do` <br>
`IFS=',':` Internal Field Separator (IFS) sebagai koma (,), sehingga read akan memisahkan setiap kolom berdasarkan koma. <br>
`read -r _ _ _ _ _ duration _ device _; do` mengabaikan semua kolom kecuali duration dan device. <br>
`avg=$(echo "scale=2; ${durasi[Tablet]} / ${perangkat[Tablet]}"` adalah
variabel avg berisi pembagian antara jumlah durasi tablet dengan total frekuensi tablet yang muncul.
### Output 1b.
![hasil2](https://github.com/user-attachments/assets/3473c25a-211a-49df-aea2-46ef0b14721b)

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
![hasil3](https://github.com/user-attachments/assets/58cd98de-64d9-4f25-a3b8-eae3936c3336)

### 1d

`if [[ "$date" > "2023-12-31" ]]
    then
        genre_count[$genre]=$((${genre_count[$genre]:-0} + 1))
    fi`

Operasi berjalan jika pada kolom Read_Date lebih dari 31 Desember 2023. <br>

`(${genre_count[$genre]:-0} + 1))`
Jika genre_count[$genre] belum ada, maka dianggap bernilai nol (0) untuk menghindari error. <br>

`for i  in "${!genre_count[@]}"; do` 
Mengambil semua key (nama genre) dalam array asosiatif genre_count. Loop ini akan mengecek semua genre yang ada. <br>

`if (( genre_count[$i] > num ))
    num=${genre_count[$i]}`
Mengecek apakah jumlah buku untuk genre $i lebih besar dari jumlah tertinggi yang sudah ditemukan sejauh ini. Jika genre saat ini memiliki jumlah yang lebih besar, maka num diperbarui dengan jumlah buku dari genre tersebut.

### Output 1d

![hasil4](https://github.com/user-attachments/assets/4cc96db1-00dd-4f12-aa5b-67c2beb475cb)


# soal no 2

### Kerangka Nomor 2
![krgkg](https://github.com/user-attachments/assets/3da30948-9d44-4194-a670-b9d27858d036)



# soal no 3
### 3.1 Speak To Me
speak_to_me() {
    echo "Playing: Speak to Me 🎵"
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | awk -F'"' '{print $4}')
        echo "$affirmation"
        sleep 1
    done
   
Kode diatas memulai loop untuk `(while true)` agar script terus berjalan. Sedangkan `curl -s` mengambil words of affirmation dari situs https://www.affirmations.dev. Untuk `awk -F'"' '{print $4}'` digunakan mengekstrak teks affirmation dari JSON yang diterima. `echo "$affirmation"` digunakan untuk mencetak kata-kata motivasi ke layar dan `sleep 1` digunakan untuk memberikan rentang waktu 1 detik.


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

 


