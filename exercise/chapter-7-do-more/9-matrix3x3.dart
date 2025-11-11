import '../reads.dart';

void main() {
  int rowSize = 3;
  int columnSize = 3;

  List<List<double>> matrix = [];
  List<List<double>> resultMatrix = [];

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);

    for (int col = 0; col < columnSize; col++) {
      double number = readDouble(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      matrix[row].add(number);
    }
  }

  double multiplier = readDouble("write the number to multiply by: ");

  for (int row = 0; row < rowSize; row++) {
    resultMatrix.add([]);

    for (int col = 0; col < columnSize; col++) {
      double originalValue = matrix[row][col];

      double newValue = originalValue * multiplier;

      resultMatrix[row].add(newValue);
    }
  }

  print("Result Matrix: $resultMatrix");
}
