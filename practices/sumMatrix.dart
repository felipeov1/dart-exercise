import 'dart:io';

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [1, 2, 3],
    [1, 2, 3],
  ];

  matrix.clear();

  print("write how many columns will store: ");
  int columnSize = int.tryParse(stdin.readLineSync().toString()) ?? 0;

  print("write how many rows will store: ");
  int rowSize = int.tryParse(stdin.readLineSync().toString()) ?? 0;

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int column = 0; column < columnSize; column++) {
      print("write the element in the column $column and row $row: ");
      matrix[row].add(int.tryParse(stdin.readLineSync().toString()) ?? 0);
    }
  }
  int sum = 0;

  for (int column = 0; column < matrix.length; column++) {
    for (int row = 0; row < matrix[column].length; row++) {
      sum += matrix[column][row];
    }
  }
  print("The sum of the matrix is $sum");
}
