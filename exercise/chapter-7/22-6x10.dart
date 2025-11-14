import '../reads.dart';

void main() {
  int rowSize = 6;
  int columnSize = 10;

  List<List<int>> matrix = [];
  
  List<int> sumRow = List.filled(columnSize, 0);

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    
    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );

      matrix[row].add(number);
      
      sumRow[col] += number;
    }
  }

  matrix.add(sumRow);

  matrix.forEach(print);
}