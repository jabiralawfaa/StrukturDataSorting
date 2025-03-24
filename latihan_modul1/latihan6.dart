class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    // Membandingkan berdasarkan NRP
    return this.nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'NRP: $nrp, Nama: $nama';
  }
}

class Latihan {
  static void selectionSort<T extends Comparable<T>>(List<T> arr) {
    T temp;
    for (int i = arr.length - 1; i >= 0; i--) {
      int maxIndex = i;
      for (int j = i - 1; j >= 0; j--) {
        if (arr[j].compareTo(arr[maxIndex]) > 0) {
          maxIndex = j;
        }
      }
      temp = arr[i];
      arr[i] = arr[maxIndex];
      arr[maxIndex] = temp;
    }
  }

  static void display<T>(List<T> data) {
    data.forEach((item) => print(item));
    print('');
  }

  static void main() {
    List<Mahasiswa> arr8 = [
      Mahasiswa("02", "Budi"),
      Mahasiswa("01", "Andi"),
      Mahasiswa("04", "Udin"),
      Mahasiswa("03", "Candra")
    ];

    print('Data Sebelum Pengurutan:');
    display(arr8);

    DateTime start = DateTime.now();
    selectionSort(arr8);
    Duration elapsedTime = DateTime.now().difference(start);

    print('Data Setelah Pengurutan:');
    display(arr8);
    
    print('Waktu Eksekusi: ${elapsedTime.inMilliseconds} ms');
  }
}

void main() {
  Latihan.main();
}