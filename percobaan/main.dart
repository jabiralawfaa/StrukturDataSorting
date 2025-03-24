import 'bubble_sort.dart';
import 'insertion_sort.dart';
import 'selection_sort.dart';

void main() {
  List<int> list = [64, 34, 25, 12, 22, 11, 90];
  print('Sebelum diurutkan: $list');

  DateTime now = DateTime.now();
  // selectionSort(list);
  // selectionSortDescending(list);
  // insertionSort(list);
  // insertionSortDescending(list);
  // bubbleSort(list);
  // bubbleSortDescending(list);
  DateTime end = DateTime.now();

  print(
      'Waktu yang diperlukan: ${end.difference(now).inMicroseconds} micro second');
}
