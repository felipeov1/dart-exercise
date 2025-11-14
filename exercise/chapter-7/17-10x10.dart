import '../reads.dart';

void main() {
  int size = 10;
  List<List<int>> matrix = [];
  int sumMainDiagonal = 0;

  for (int row = 0; row < size; row++) {
    matrix.add([]);

    for (int col = 0; col < size; col++) {
      int number = readInt("write a number for [${row + 1}][${col + 1}]: ");

      matrix[row].add(number);

      if (row == col) {
        sumMainDiagonal += number;
      }
    }
  }

  double average = sumMainDiagonal / size;

  matrix.forEach(print);

  print("Sum of the Main Diagonal: $sumMainDiagonal");
  print("Average of the Main Diagonal: $average");
}
