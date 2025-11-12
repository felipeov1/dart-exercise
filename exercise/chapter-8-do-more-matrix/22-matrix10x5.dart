import '../reads.dart';

List<List<double>> readMatrix() {
  int rowSize = 10;
  int colSize = 5;
  List<List<double>> matrix = [];

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int col = 0; col < colSize; col++) {
      double realNum = readDouble(
        "write number for [${row + 1}][${col + 1}]: ",
      );
      matrix[row].add(realNum);
    }
  }
  return matrix;
}

double sumElementsBelowSixthRow(List<List<double>> matrix) {
  double sum = 0.0;
  
  for (int row = 6; row < 10; row++) {
    for (int col = 0; col < 5; col++) {
      sum += matrix[row][col];
    }
  }
  return sum;
}

void main() {
  List<List<double>> myMatrix = readMatrix();
  
  double result = sumElementsBelowSixthRow(myMatrix);

  print("Matrix: $myMatrix");
  print("Sum of elements below the 6 row: $result");
}