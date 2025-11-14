import '../reads.dart';

void main() {
  int rowSize = 8;
  int columnSize = 6;
  List<List<int>> matrix = [];

  int sumEvenRows = 0;
  int countEvenElements = 0;

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);

    for (int col = 0; col < columnSize; col++) {
      int number = readInt("write a number for [${row + 1}][${col + 1}]: ");
      matrix[row].add(number);

      if (row % 2 == 0) {
        sumEvenRows += number;
        countEvenElements++;
      }
    }
  }

  double average = 0;
  if (countEvenElements > 0) {
    average = sumEvenRows / countEvenElements;
  }

  print("Sum of elements in even rows: $sumEvenRows");
  print("Count of elements in even rows: $countEvenElements");
  print("Average of elements in even rows: ${average.toStringAsFixed(2)}");
}
