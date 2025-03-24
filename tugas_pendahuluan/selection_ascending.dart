void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int currentValue = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > currentValue) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = currentValue;
  }
}

void main() {
  List<int> data = [3, 4, 64, 13, 657, 75, 23, 45, 1, 2];
  print('Sebelum diurutkan: ${data.join(', ')}');
  DateTime start = DateTime.now();
  insertionSort(data);
  int elapsedTime = DateTime.now().difference(start).inMicroseconds;
  print('Setelah diurutkan: ${data.join(', ')}');
  print('Waktu: $elapsedTime micro second');
}
