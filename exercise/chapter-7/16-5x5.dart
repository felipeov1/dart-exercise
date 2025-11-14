import '../reads.dart';

void main() {
  int rowSize = 5;
  int columnSize = 5;

  List<List<int>> matrix = [];
  
  List<int> sumRows = List.filled(rowSize, 0);
  List<int> sumColumns = List.filled(columnSize, 0);

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]); 

    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      
      matrix[row].add(number);
      
      sumRows[row] += number;
      
      sumColumns[col] += number;
    }
  }

  print("Sum of Rows (Vector): $sumRows");
  print("Sum of Columns (Vector): $sumColumns");
}