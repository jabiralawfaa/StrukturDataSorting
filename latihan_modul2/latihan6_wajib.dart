import 'dart:io';
import 'dart:core';

void generateAndAddRandomList(List<num> targetList, int jumlahData) {
  // Generate list berurutan dari 0 sampai jumlahData-1
  List<int> generatedList = List<int>.generate(jumlahData, (index) => index);

  // Mengacak urutan list
  generatedList.shuffle();

  // Menambahkan semua elemen ke list target
  targetList.addAll(generatedList);
}

// Fungsi untuk menyimpan ke CSV dengan struktur baru
Future<void> saveToCsv(Map<String, dynamic> rowData) async {
  try {
    final file = File('sorting_performance.csv');
    final headers = [
      "Jumlah Data",
      "Insertion Sort",
      "Selection Sort",
      "Bubble Sort",
      "Shell Sort",
      "Quick Sort",
      "Merge Sort",
      "Tanggal" // Menambahkan header untuk kolom tanggal
    ];

    // Format tanggal
    String getDateString() {
      DateTime now = DateTime.now();
      return "${now.year}-${now.month.toString().padLeft(2, '0')}-"
          "${now.day.toString().padLeft(2, '0')} "
          "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}:"
          "${now.second.toString().padLeft(2, '0')}";
    }

    // Tulis header jika file baru
    if (!await file.exists()) {
      await file.writeAsString(headers.join(',') + '\n');
    }

    // Siapkan baris data
    List<String> row = [
      rowData['size'].toString(),
      rowData['Insertion'].toString(),
      rowData['Selection'].toString(),
      rowData['Bubble'].toString(),
      rowData['Shell'].toString(),
      rowData['Quick'].toString(),
      rowData['Merge'].toString(),
      getDateString() // Menambahkan tanggal sebagai kolom terakhir
    ];

    // Simpan ke file
    await file.writeAsString(row.join(',') + '\n', mode: FileMode.append);
  } catch (e) {
    print('Error saat menyimpan ke CSV: $e');
  }
}

// insertion sort
void insertionSort<T extends Comparable<T>>(List<T> arr) {
  for (int i = arr.length - 1; i >= 0; i--) {
    for (int j = i + 1, k = i; j < arr.length; j++) {
      if (arr[j].compareTo(arr[k]) > 0) {
        break;
      } else {
        T temp = arr[k];
        arr[k] = arr[j];
        arr[j] = temp;
        k = j;
      }
    }
  }
}

// selection sort
void selectionSort<T extends Comparable<T>>(List<T> arr) {
  T temp;
  for (int i = arr.length - 1; i >= 0; i--) {
    int max = i;
    for (int j = i - 1; j >= 0; j--) {
      if (arr[j].compareTo(arr[max]) > 0) max = j;
    }
    temp = arr[i];
    arr[i] = arr[max];
    arr[max] = temp;
  }
}

// bubble sort
void bubbleSort<T extends Comparable<T>>(List<T> arr) {
  int i, j;
  T temp;
  for (i = 0; i < arr.length - 1; i++) {
    for (j = 0; j < arr.length - i - 1; j++) {
      if (arr[j].compareTo(arr[j + 1]) > 0) {
        temp = arr[j + 1];
        arr[j + 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
}

// shell sort
void shellSort<T extends Comparable<T>>(List<T> arr) {
  int i, jarak;
  bool didSwap = true;
  T temp;
  jarak = arr.length;
  while (jarak > 1) {
    jarak = (jarak / 2).floor();
    didSwap = true;
    while (didSwap) {
      didSwap = false;
      i = 0;
      while (i < (arr.length - jarak)) {
        if (arr[i].compareTo(arr[i + jarak]) > 0) {
          temp = arr[i];
          arr[i] = arr[i + jarak];
          arr[i + jarak] = temp;
          didSwap = true;
        }
        i++;
      }
    }
  }
}

// quick sort
void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int q;
  if (p < r) {
    q = partition(arr, p, r);
    quickSort(arr, p, q);
    quickSort(arr, q + 1, r);
  }
}

int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i, j;
  T pivot, temp;
  pivot = arr[p];
  i = p;
  j = r;
  while (i <= j) {
    while (pivot.compareTo(arr[j]) < 0) j--;
    while (pivot.compareTo(arr[i]) > 0) i++;
    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      return j;
    }
  }
  return j;
}

// merge sort
void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r) {
  int med;
  if (l < r) {
    med = (l + r) ~/ 2;
    mergeSort(arr, l, med);
    mergeSort(arr, med + 1, r);
    merge(arr, l, med, r);
  }
}

void merge<T extends Comparable<T>>(
    List<T> arr, int left, int median, int right) {
  List<T?> temp = List.filled(arr.length, null);
  int kiri1, kanan1, kiri2, kanan2, i, j;
  kiri1 = left;
  kanan1 = median;
  kiri2 = median + 1;
  kanan2 = right;
  i = left;
  while ((kiri1 <= kanan1) && (kiri2 <= kanan2)) {
    if (arr[kiri1].compareTo(arr[kiri2]) <= 0) {
      temp[i] = arr[kiri1];
      kiri1++;
    } else {
      temp[i] = arr[kiri2];
      kiri2++;
    }
    i++;
  }
  while (kiri1 <= kanan1) {
    temp[i] = arr[kiri1];
    kiri1++;
    i++;
  }
  while (kiri2 <= kanan2) {
    temp[i] = arr[kiri2];
    kiri2++;
    i++;
  }
  j = left;
  while (j <= right) {
    arr[j] = temp[j]!;
    j++;
  }
}

void display<T>(List<T> data) {
  for (T obj in data) {
    stdout.write('$obj ');
  }
  print('');
}

void main() async {
  try {
    // Daftar ukuran data yang akan diuji
    List<int> dataSizes = [500000];

    for (int size in dataSizes) {
      print('Memproses data dengan ukuran: $size');
      List<num> baseData = [];
      generateAndAddRandomList(baseData, size);

      Map<String, int> times = {};

      try {
        // Insertion Sort
        List<num> dataCopy = List<num>.from(baseData);
        DateTime start = DateTime.now();
        insertionSort<num>(dataCopy);
        times['Insertion'] = DateTime.now().difference(start).inMilliseconds;

        // Selection Sort
        dataCopy = List<num>.from(baseData);
        start = DateTime.now();
        selectionSort<num>(dataCopy);
        times['Selection'] = DateTime.now().difference(start).inMilliseconds;

        // Bubble Sort
        dataCopy = List<num>.from(baseData);
        start = DateTime.now();
        bubbleSort<num>(dataCopy);
        times['Bubble'] = DateTime.now().difference(start).inMilliseconds;

        // Shell Sort
        dataCopy = List<num>.from(baseData);
        start = DateTime.now();
        shellSort<num>(dataCopy);
        times['Shell'] = DateTime.now().difference(start).inMilliseconds;

        // Quick Sort
        dataCopy = List<num>.from(baseData);
        start = DateTime.now();
        quickSort<num>(dataCopy, 0, dataCopy.length - 1);
        times['Quick'] = DateTime.now().difference(start).inMilliseconds;

        // Merge Sort
        dataCopy = List<num>.from(baseData);
        start = DateTime.now();
        mergeSort<num>(dataCopy, 0, dataCopy.length - 1);
        times['Merge'] = DateTime.now().difference(start).inMilliseconds;

        // Simpan ke CSV
        await saveToCsv({
          'size': size,
          'Insertion': times['Insertion'],
          'Selection': times['Selection'],
          'Bubble': times['Bubble'],
          'Shell': times['Shell'],
          'Quick': times['Quick'],
          'Merge': times['Merge'],
        });

        print('Selesai: $size\n');
      } catch (e) {
        print('Error saat memproses ukuran data $size: $e');
        continue; // Lanjut ke ukuran data berikutnya jika terjadi error
      }
    }

    print('Semua pengujian selesai! File CSV telah diperbarui.');
  } catch (e) {
    print('Error utama: $e');
  }
}
