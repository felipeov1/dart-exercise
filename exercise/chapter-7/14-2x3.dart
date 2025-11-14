import '../reads.dart';

void main() {
  int rowSize = 2;
  int columnSize = 3;

  List<List<int>> matrix = [];
  int count = 0;


  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);

    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      matrix[row].add(number);

      if (number < 5 || number > 15) {
        count++;
      }
    }
  }

  print("Quantity of elements not in the interval [5, 15]: $count");
}