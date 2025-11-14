import '../reads.dart';

void main() {
  int rowSizeM = 4;
  int columnSizeM = 6;

  int rowSizeN = 6;
  int columnSizeN = 4;

  List<List<int>> matrixM = [];
  List<List<int>> matrixN = [];

  List<int> sumRowsM = List.filled(rowSizeM, 0);
  List<int> sumColsN = List.filled(columnSizeN, 0);

  for (int row = 0; row < rowSizeM; row++) {
    matrixM.add([]);

    for (int column = 0; column < columnSizeM; column++) {
      int number = readInt(
        "write a number for column: ${column + 1} and row: ${row + 1}: ",
      );

      matrixM[row].add(number);
    }
  }
  for (int row = 0; row < rowSizeN; row++) {
    matrixN.add([]);

    for (int column = 0; column < columnSizeN; column++) {
      int number = readInt(
        "write a number for column: ${column + 1} and row: ${row + 1}: ",
      );

      matrixN[row].add(number);
    }
  }

  List<int> finalSum = List.filled(rowSizeM, 0); 

  for (int i = 0; i < rowSizeM; i++) {
    finalSum[i] = sumRowsM[i] + sumColsN[i];
  }

  print("Sum vector 1 + vector 2:  $finalSum");
}
