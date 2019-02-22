# SoalShift_Modul1_B8


1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
> Hint: Base64, Hexdump

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
   * Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
   * Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
   * Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
        
3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
   * Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
   * Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
   * Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
   * Password yang dihasilkan tidak boleh sama.
### **Penyelesaian**
* Langkah pertama yang harus dilakukan adalah membuat suatu fungsi untuk membentuk password alphanumerik acak sebanyak 12 karakter.
```
makePassword() {
    newPass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
}
```

* Setelah itu program harus mencari nama file dimulai dari password1.txt. Misalkan berhasil, program akan melanjutkan mencari file password2.txt, dan seterusnya. Seandainya file yang dicari tidak ditemukan, password baru akan dibuat dan disimpan menggunakan nama file tersebut.
```
fname=""
i=1
while [ true ]
do
    check=`ls "password"$i".txt" 2> /dev/null`
    if [ ${#check} == 0 ]
    then
        fname="password"$i".txt"
        break
    fi
    i=`expr $i + 1`
done
```

* Ketika nama file sudah ditentukan, program akan menyusun string password baru. Sebelum disimpan ke dalam file baru, pasword ini dipastikan tidak menyamai password yang pernah dibuat sebelumnya. Jika sudah lolos pengecekan, string password tersebut akan disimpan ke dalam file baru.
```
makePassword
passCheck=`grep -w $newPass password*.txt 2> /dev/null`
while [ ${#passCheck} != 0 ]
do
    makePassword
    passCheck=`grep -w $newPass password*.txt 2> /dev/null`
done
echo $newPass > $fname
```

* Dari langkah-langkah di atas, akan terbentuk code seperti ini:
```
#!/bin/bash

makePassword() {
    newPass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
}

fname=""
i=1
while [ true ]
do
    check=`ls "password"$i".txt" 2> /dev/null`
    if [ ${#check} == 0 ]
    then
        fname="password"$i".txt"
        break
    fi
    i=`expr $i + 1`
done
makePassword
passCheck=`grep -w $newPass password*.txt 2> /dev/null`
while [ ${#passCheck} != 0 ]
do
    makePassword
    passCheck=`grep -w $newPass password*.txt 2> /dev/null`
done
echo $newPass > $fname
```

4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
        - Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
        - Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
        - setelah huruf z akan kembali ke huruf a
        - Backup file syslog setiap jam.
        - dan buatkan juga bash script untuk dekripsinya.
        
5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:
        - Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
        - Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
        - Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
        - Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
