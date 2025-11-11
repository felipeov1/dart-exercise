import '../reads.dart';

void main() {
  int rowSize = 4;
  int columnSize = 5;

  List<List<int>> matrix = [];
  List<int> columnSums = List.filled(columnSize, 0);

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int col = 0; col < columnSize; col++) {
      int number = readInt(
        "write a number for [${row + 1}][${col + 1}]: ",
      );
      matrix[row].add(number);
      
      columnSums[col] += number;
    }
  }

  bool foundElement = false;

  print("\n");

  for (int sum in columnSums) {
    if (sum > 10) {
      print(sum);
      foundElement = true;
    }
  }

  if (foundElement == false) {
    print("No element greater than 10 was found.");
  }
}