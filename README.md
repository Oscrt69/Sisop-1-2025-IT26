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
```
Secara keseluruhan, kode ini menggunakan if-else sesuai peraturan yang diberikan
### 1.3 `sumbook=$(awk -F',' '$2 == "Chris Hemsworth" {count++} END {print count}' reading_data.csv)`
Pada line ini, `awk -F',' '$2` menunjukkan jika dari file csv tersebut akan dicari di kolom 2 yaitu penyanyi dengan tiap tabelnya terpisah oleh koma yang kalimatnya terdapat kata "Christ Hemworth", dan
`{count++}` akan menambahkan count setiap kali ditemukan nama "Chris Hemsworth" pada kolom ke-2.
### 1.4 `while IFS=',' read -r _ _ _ _ _ duration _ device _; do`
while: Memulai loop yang akan membaca setiap baris dalam file reading_data.csv satu per satu.
IFS=',': Menetapkan Internal Field Separator sebagai koma (,), sehingga read akan memisahkan setiap kolom berdasarkan koma.

# soal no 2

# soal no 3

# soal no 4
