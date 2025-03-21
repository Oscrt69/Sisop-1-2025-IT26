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
END {max = 0; for (i in genre) {if (genre[i] > max) {max = genre[i];common = i;}} print "Genre paling populer di Asia setelah 2023 adalah " common " dengan " max " buku."}' reading_data.csv

else
    echo "Pilihan tidak valid"
fi 
