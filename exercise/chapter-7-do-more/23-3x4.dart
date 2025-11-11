import '../reads.dart';

void main() {
  int rowSize = 3;
  int columnSize = 4;
  List<List<int>> matrix = [];

  int evenCount = 0;
  int oddSum = 0;
  int totalSum = 0;

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      matrix[row].add(number);

      if (number % 2 == 0) {
        evenCount++;
      } else {
        oddSum += number;
      }
      
      totalSum += number;
    }
  }

  double average = totalSum / (rowSize * columnSize);

  print("Quantity of even elements: $evenCount");
  print("Sum of odd elements: $oddSum");
  print("Average of all elements: ${average.toStringAsFixed(2)}");
}