import '../reads.dart';

void main() {
  int rowSize = 5;
  int columnSize = 5;

  List<List<int>> numbers = [];

  for (int row = 0; row < rowSize; row++) {
    numbers.add([]);
    for (int col = 0; col < columnSize; col++) {
      int number = readInt("write a number for [${row + 1}][${col + 1}]: ");
      numbers[row].add(number);
    }
  }

  int sumRow4 = 0;
  int sumColumn2 = 0;
  int sumMainDiagonal = 0;
  int sumSecondaryDiagonal = 0;
  int totalSum = 0;

  for (int row = 0; row < rowSize; row++) {
    for (int col = 0; col < columnSize; col++) {
      int currentValue = numbers[row][col];

      if (row == 3) {
        sumRow4 += currentValue;
      }

      if (col == 1) {
        sumColumn2 += currentValue;
      }

      if (row == col) {
        sumMainDiagonal += currentValue;
      }

      if (row + col == rowSize - 1) {
        sumSecondaryDiagonal += currentValue;
      }

      totalSum += currentValue;
    }
  }

  print("Sum of Row 4: $sumRow4");
  print("Sum of Column 2: $sumColumn2");
  print("Sum of Main Diagonal: $sumMainDiagonal");
  print("Sum of Secondary Diagonal: $sumSecondaryDiagonal");
  print("Sum of all elements: $totalSum");
}