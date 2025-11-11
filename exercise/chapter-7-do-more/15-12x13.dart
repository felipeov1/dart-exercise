import '../reads.dart';

void main() {
  int rowSize = 12;
  int columnSize = 13;

  List<List<int>> originalMatrix = [];
  List<List<double>> modifiedMatrix = [];

  for (int row = 0; row < rowSize; row++) {
    originalMatrix.add([]);
    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      originalMatrix[row].add(number);
    }
  }

  for (int row = 0; row < rowSize; row++) {
    
    int largestModulus = 0;
    for (int col = 0; col < columnSize; col++) {
      int currentModulus = originalMatrix[row][col].abs();
      if (currentModulus > largestModulus) {
        largestModulus = currentModulus;
      }
    }
    
    modifiedMatrix.add([]);

    for (int col = 0; col < columnSize; col++) {
      int originalValue = originalMatrix[row][col];

      if (largestModulus == 0) {
        modifiedMatrix[row].add(0.0);
      } else {
        double newValue = originalValue / largestModulus;
        modifiedMatrix[row].add(newValue);
      }
    }
  }

  print("Original Matrix");
  originalMatrix.forEach(print);

  print("Modified Matrix");
  modifiedMatrix.forEach(print);
}