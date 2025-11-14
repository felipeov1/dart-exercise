import '../reads.dart';

void main() {
  int size = 5;
  
  List<List<double>> matrix = [];

  for (int row = 0; row < size; row++) {
    matrix.add([]);
    for (int col = 0; col < size; col++) {
      double number = readDouble(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      matrix[row].add(number);
    }
  }

  for (int row = 0; row < size; row++) {
    double diagonalElement = matrix[row][row];
    
    for (int col = 0; col < size; col++) {
      matrix[row][col] = matrix[row][col] * diagonalElement;
    }
  }

  matrix.forEach(print);
}