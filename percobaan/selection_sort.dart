void selectionSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j;
      }
    }
    int temp = list[minIndex];
    list[minIndex] = list[i];
    list[i] = temp;
  }
  print('Setelah diurutkan: $list');
}

void selectionSortDescending(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    int maxIndex = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] > list[maxIndex]) {
        maxIndex = j;
      }
    }
    int temp = list[maxIndex];
    list[maxIndex] = list[i];
    list[i] = temp;
  }
  print('Setelah diurutkan: $list');
}
