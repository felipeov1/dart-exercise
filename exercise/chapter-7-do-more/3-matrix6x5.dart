import 'dart:math';

void main() {
  int rowSize = 2;
  int columnSize = 4;

  var random = Random();

  List<List<int>> matrix = [];

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int column = 0; column < columnSize; column++) {
      int value = random.nextInt(30) + 1;
      matrix[row].add(value);
    }
  }

  for (int row = 0; row < rowSize; row++) {
    for (int column = 0; column < columnSize; column++) {
      int value = matrix[row][column];
      print('Element: $value is on Row: $row, Column: $column');
    }
  }

  int highElement = matrix[0][0];
  int lowElement = matrix[0][0];
  int highRow = 0;
  int highCol = 0;
  int lowRow = 0;
  int lowCol = 0;

  for (int row = 0; row < rowSize; row++) {
    for (int column = 0; column < columnSize; column++) {
      int currentValue = matrix[row][column];

      if (currentValue > highElement) {
        highElement = currentValue;
        highRow = row;
        highCol = column;
      }

      if (currentValue < lowElement) {
        lowElement = currentValue;
        lowRow = row;
        lowCol = column;
      }
    }
  }

  print('Higher Element: $highElement at position: Row $highRow, Column $highCol');
  print('Lower Element: $lowElement at position: Row $lowRow, Column $highCol');
}