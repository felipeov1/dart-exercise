import 'dart:math';

void main() {
  int rowSize = 2;
  int columnSize = 4;

  var random = Random();

  List<List<int>> matrix = [];

  int count = 0;

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int column = 0; column < columnSize; column++) {
      int value = random.nextInt(30) + 1;
      matrix[row].add(value);
    }
  }

  
  int rowIndexShowMatrix = 0;

  for (var row in matrix) {
    int countPerLine = 0;
    for (int element in row) {
      if (element >= 12 && element <= 20) {
        countPerLine++;
      }
    }
    print("${++rowIndexShowMatrix}: $row. There are/is $countPerLine elements between 12 and 20");
  }
}
