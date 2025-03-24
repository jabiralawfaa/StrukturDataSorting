void shellSort(List<int> arr) {
  int n = arr.length;
  int gap = n ~/ 2;

  while (gap > 0) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j = i;

      while (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j -= gap;
      }

      arr[j] = temp;
    }

    gap = gap ~/ 2;
  }
}

void main() {
  List<int> data = [12, 34, 54, 2, 3];
  print('Sebelum diurutkan: ${data.join(', ')}');
  DateTime start = DateTime.now();
  shellSort(data);
  int elapsedTime = DateTime.now().difference(start).inMicroseconds;
  print('Setelah diurutkan: ${data.join(', ')}');
  print('Waktu: $elapsedTime micro second');
}
