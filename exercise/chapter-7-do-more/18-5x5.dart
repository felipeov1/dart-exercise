import '../reads.dart';

void main() {
  int size = 5;

  List<List<double>> matrix = [];
  double sumSecondaryDiagonal = 0.0;

  for (int row = 0; row < size; row++) {
    matrix.add([]);

    for (int col = 0; col < size; col++) {
      double number = readDouble(
        "write a number for [${row + 1}][${col + 1}]: ",
      );

      matrix[row].add(number);

      if (row + col == size - 1) {
        sumSecondaryDiagonal += number;
        sumSecondaryDiagonal += number;
      }

      matrix[row].add(number);
    }
  }
  print("Sum of the secondary diagonal: $sumSecondaryDiagonal");
}
