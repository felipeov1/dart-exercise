import '../reads.dart';

void main() {
  int rowSize = 6;
  int columnSize = 4;

  List<List<int>> numbers = [];
  List<List<int>> resultMatrix = [];

  for (int row = 0; row < rowSize; row++) {
    numbers.add([]);
    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      numbers[row].add(number);
    }
  }

  for (int row = 0; row < rowSize; row++) {
    int largestInRow = numbers[row][0];
    for (int col = 1; col < columnSize; col++) {
      if (numbers[row][col] > largestInRow) {
        largestInRow = numbers[row][col];
      }
    }

    resultMatrix.add([]);
    
    for (int col = 0; col < columnSize; col++) {
      int originalValue = numbers[row][col];
      int newValue = originalValue * largestInRow;
      resultMatrix[row].add(newValue);
    }
  }

  print("Result Matrix: $resultMatrix");
}