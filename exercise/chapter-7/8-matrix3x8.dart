import '../reads.dart';

void main() {
  int rowSize = 3;
  int columnSize = 8;

  List<List<int>> numbersA = [];
  List<List<int>> numbersB = [];

  for (int row = 0; row < rowSize; row++) {
    numbersA.add([]);

    for (int column = 0; column < columnSize; column++) {
      int number = readInt(
        "write a number for row: ${row + 1}, column: ${column + 1}: ",
      );

      numbersA[row].add(number);
    }
  }

  for (int row = 0; row < rowSize; row++) {
    numbersB.add([]);

    for (int column = 0; column < columnSize; column++) {
      int number = readInt(
        "write a number for row: ${row + 1}, column: ${column + 1}: ",
      );

      numbersB[row].add(number);
    }
  }

  List<List<int>> sumMatrix = [];
  List<List<int>> differenceMatrix = [];

  for (int row = 0; row < rowSize; row++) {
    sumMatrix.add([]);
    differenceMatrix.add([]);

    for (int column = 0; column < columnSize; column++) {
      int valueA = numbersA[row][column];
      int valueB = numbersB[row][column];

      int sum = valueA + valueB;
      int difference = valueA - valueB;

      sumMatrix[row].add(sum);
      differenceMatrix[row].add(difference);
    }
  }

  print("Sum Matrix (A + B): $sumMatrix");
  print("Difference Matrix (A - B): $differenceMatrix");
}