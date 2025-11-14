import 'dart:math';

void main() {
  int rowSize = 3;
  int columnSize = 5;
  var random = Random();

  List<List<int>> matrix = [];

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int column = 0; column < columnSize; column++) {
      int value = random.nextInt(30) + 1;
      matrix[row].add(value);
    }
  }

  int count = 0;

  for (int row = 0; row < rowSize; row++) {
    for (int column = 0; column < columnSize; column++) {
      int element = matrix[row][column];

      if (element > 15 && element < 20) {
        count++;
      }
    }
  }

  for (var row in matrix) {
    print(row);
  }

  print("the number of numbers between 15 and 20 is: $count");
}
