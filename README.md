# Sorting

Sorting adalah proses mengatur elemen-elemen dalam suatu koleksi (seperti array atau daftar) dalam urutan tertentu, biasanya urutan menaik atau menurun. Ada berbagai algoritma sorting yang digunakan dalam ilmu komputer, masing-masing dengan karakteristik dan kinerja yang berbeda. Berikut adalah beberapa algoritma sorting yang umum digunakan:

## 1. Bubble Sort

Bubble Sort adalah algoritma sederhana yang berulang kali menukar elemen yang berdekatan jika mereka berada dalam urutan yang salah. Algoritma ini memiliki kompleksitas waktu O(n^2) dalam kasus terburuk.

## 2. Selection Sort

Selection Sort bekerja dengan membagi array menjadi dua bagian: bagian yang sudah diurutkan dan bagian yang belum diurutkan. Algoritma ini kemudian berulang kali memilih elemen terkecil dari bagian yang belum diurutkan dan menukarnya dengan elemen pertama dari bagian yang belum diurutkan. Kompleksitas waktu dalam kasus terburuk adalah O(n^2).

## 3. Insertion Sort

Insertion Sort membangun array yang diurutkan satu per satu dengan mengambil setiap elemen dari array yang belum diurutkan dan menyisipkannya ke posisi yang tepat dalam array yang sudah diurutkan. Kompleksitas waktu dalam kasus terburuk adalah O(n^2), tetapi lebih efisien untuk daftar yang hampir terurut.

## 4. Merge Sort

Merge Sort adalah algoritma berbasis divide-and-conquer yang membagi array menjadi dua bagian, mengurutkan setiap bagian secara rekursif, dan kemudian menggabungkan dua bagian yang sudah diurutkan. Algoritma ini memiliki kompleksitas waktu O(n log n) dalam semua kasus.

## 5. Quick Sort

Quick Sort juga menggunakan pendekatan divide-and-conquer dengan memilih elemen pivot dan membagi array menjadi dua bagian berdasarkan pivot tersebut. Bagian-bagian tersebut kemudian diurutkan secara rekursif. Kompleksitas waktu rata-rata adalah O(n log n), tetapi dalam kasus terburuk bisa menjadi O(n^2).

## 6. Heap Sort

Heap Sort menggunakan struktur data heap untuk mengurutkan elemen. Algoritma ini membangun heap dari array dan kemudian berulang kali mengekstrak elemen maksimum dari heap dan menempatkannya di akhir array yang diurutkan. Kompleksitas waktu dalam kasus terburuk adalah O(n log n).

Setiap algoritma memiliki kelebihan dan kekurangan tergantung pada konteks penggunaannya, seperti ukuran data dan kebutuhan kinerja.
