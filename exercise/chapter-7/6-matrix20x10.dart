import '../reads.dart';

void main() {
  int rowSize = 20;
  int columnSize = 10;

  List<List<int>> numbers = [];
  List<int> sumColumns = List.filled(columnSize, 0);

  for (int row = 0; row < rowSize; row++) {
    numbers.add([]);

    for (int column = 0; column < columnSize; column++) {
      int number = readInt(
        "write a number for column: ${column + 1} and row: ${row + 1}: ",
      );

      numbers[row].add(number);

      sumColumns[column] += number;
    }
  }

  print("Column sums: $sumColumns");

  List<List<int>> resultingMatrix = [];

  for (int row = 0; row < rowSize; row++) {
    resultingMatrix.add([]); 
    
    for (int column = 0; column < columnSize; column++) {
      int originalValue = numbers[row][column];
      int columnSum = sumColumns[column];
      
      int newValue = originalValue * columnSum;
      
      resultingMatrix[row].add(newValue);
    }
  }

  print("Resulting matrix  multiplication: $resultingMatrix");
}