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
### 1.3 `sumbook=$(awk -F',' '$2 == "Chris Hemsworth" {count++} END {print count}' reading_data.csv)`
Pada line ini, `awk -F',' '$2` menunjukkan jika dari file csv tersebut akan dicari di kolom 2 yaitu penyanyi dengan tiap tabelnya terpisah oleh koma yang kalimatnya terdapat kata "Christ Hemworth", dan
`{count++}` akan menambahkan count setiap kali ditemukan nama "Chris Hemsworth" pada kolom ke-2.
### 1.4 `while IFS=',' read -r _ _ _ _ _ duration _ device _; do`
`IFS=',':` Internal Field Separator (IFS) sebagai koma (,), sehingga read akan memisahkan setiap kolom berdasarkan koma.
`read -r _ _ _ _ _ duration _ device _; do` mengabaikan semua kolom kecuali duration dan device.
### 1.5 `avg=$(echo "scale=2; ${durasi[Tablet]} / ${perangkat[Tablet]}"`
variabel avg berisi pembagian antara jumlah durasi tablet dengan total frekuensi tablet yang muncul.
### 1.6 Output 1a.
![hasil](https://github.com/user-attachments/assets/2ed0e40f-2ef7-46f4-aa99-607fc08a6076)
# soal no 2

# soal no 3

# soal no 4
