import 'dart:io';
import 'dart:core';

// Fungsi generate data acak
void generateAndAddRandomList(List<num> targetList, int jumlahData) {
  List<int> generatedList = List<int>.generate(jumlahData, (index) => index);
  generatedList.shuffle();
  targetList.addAll(generatedList);
}

// Fungsi sorting dengan parameter ascending/descending
void insertionSort<T extends Comparable<T>>(List<T> arr, bool ascending) {
  for (int i = arr.length - 1; i >= 0; i--) {
    for (int j = i + 1, k = i; j < arr.length; j++) {
      int comp = arr[j].compareTo(arr[k]);
      if (ascending ? comp > 0 : comp < 0) break;
      T temp = arr[k];
      arr[k] = arr[j];
      arr[j] = temp;
      k = j;
    }
  }
}

void selectionSort<T extends Comparable<T>>(List<T> arr, bool ascending) {
  T temp;
  for (int i = arr.length - 1; i >= 0; i--) {
    int selectedIndex = i;
    for (int j = i - 1; j >= 0; j--) {
      int comp = arr[j].compareTo(arr[selectedIndex]);
      if (ascending ? comp > 0 : comp < 0) selectedIndex = j;
    }
    temp = arr[i];
    arr[i] = arr[selectedIndex];
    arr[selectedIndex] = temp;
  }
}

void bubbleSort<T extends Comparable<T>>(List<T> arr, bool ascending) {
  int i, j;
  T temp;
  for (i = 0; i < arr.length - 1; i++) {
    for (j = 0; j < arr.length - i - 1; j++) {
      int comp = arr[j].compareTo(arr[j + 1]);
      if (ascending ? comp > 0 : comp < 0) {
        temp = arr[j + 1];
        arr[j + 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
}

void shellSort<T extends Comparable<T>>(List<T> arr, bool ascending) {
  int i, gap;
  bool didSwap = true;
  T temp;
  gap = arr.length;
  while (gap > 1) {
    gap = (gap / 2).floor();
    didSwap = true;
    while (didSwap) {
      didSwap = false;
      i = 0;
      while (i < (arr.length - gap)) {
        int comp = arr[i].compareTo(arr[i + gap]);
        if (ascending ? comp > 0 : comp < 0) {
          temp = arr[i];
          arr[i] = arr[i + gap];
          arr[i + gap] = temp;
          didSwap = true;
        }
        i++;
      }
    }
  }
}

void quickSort<T extends Comparable<T>>(
    List<T> arr, int p, int r, bool ascending) {
  int q;
  if (p < r) {
    q = partition(arr, p, r, ascending);
    quickSort(arr, p, q, ascending);
    quickSort(arr, q + 1, r, ascending);
  }
}

int partition<T extends Comparable<T>>(
    List<T> arr, int p, int r, bool ascending) {
  int i = p, j = r;
  T pivot = arr[p], temp;
  while (i <= j) {
    while (ascending
        ? pivot.compareTo(arr[j]) < 0
        : pivot.compareTo(arr[j]) > 0) j--;
    while (ascending
        ? pivot.compareTo(arr[i]) > 0
        : pivot.compareTo(arr[i]) < 0) i++;
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

void mergeSort<T extends Comparable<T>>(
    List<T> arr, int l, int r, bool ascending) {
  if (l < r) {
    int m = (l + r) ~/ 2;
    mergeSort(arr, l, m, ascending);
    mergeSort(arr, m + 1, r, ascending);
    merge(arr, l, m, r, ascending);
  }
}

void merge<T extends Comparable<T>>(
    List<T> arr, int l, int m, int r, bool ascending) {
  List<T> left = arr.sublist(l, m + 1);
  List<T> right = arr.sublist(m + 1, r + 1);
  int i = 0, j = 0, k = l;
  while (i < left.length && j < right.length) {
    if (ascending
        ? left[i].compareTo(right[j]) <= 0
        : left[i].compareTo(right[j]) >= 0) {
      arr[k++] = left[i++];
    } else {
      arr[k++] = right[j++];
    }
  }
  while (i < left.length) arr[k++] = left[i++];
  while (j < right.length) arr[k++] = right[j++];
}

// Fungsi tampilan
void display(List<num> data) {
  print('Data: ${data.take(10).toList()} ...');
}

void main() {
  while (true) {
    print('\nALGORITMA SORTING');
    print(
        '1. Insertion\n2. Selection\n3. Bubble\n4. Shell\n5. Quick\n6. Merge\n0. Keluar');
    stdout.write('Pilih algoritma (0-6): ');
    String? algoChoice = stdin.readLineSync();
    if (algoChoice == '0') break;

    print('\n1. Ascending\n2. Descending');
    stdout.write('Pilih urutan (1-2): ');
    String? orderChoice = stdin.readLineSync();

    bool ascending = orderChoice == '1';
    List<num> data = [];
    generateAndAddRandomList(data, 100);

    DateTime start = DateTime.now();

    switch (algoChoice) {
      case '1':
        insertionSort(data, ascending);
        break;
      case '2':
        selectionSort(data, ascending);
        break;
      case '3':
        bubbleSort(data, ascending);
        break;
      case '4':
        shellSort(data, ascending);
        break;
      case '5':
        quickSort(data, 0, data.length - 1, ascending);
        break;
      case '6':
        mergeSort(data, 0, data.length - 1, ascending);
        break;
      default:
        print('Pilihan tidak valid!');
        continue;
    }

    Duration time = DateTime.now().difference(start);
    display(data);
    print('Waktu: ${time.inMilliseconds} ms');
  }
}
