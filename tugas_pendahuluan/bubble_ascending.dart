void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> data = [64, 34, 25, 12, 22, 11, 90];
  print('Sebelum diurutkan: ${data.join(', ')}');
  DateTime start = DateTime.now();
  bubbleSort(data);
  int elapsedTime = DateTime.now().difference(start).inMicroseconds;
  print('Setelah diurutkan: ${data.join(', ')}');
  print('Waktu: $elapsedTime micro second');
}
