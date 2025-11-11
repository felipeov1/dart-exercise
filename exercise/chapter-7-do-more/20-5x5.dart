import '../reads.dart'; 

void main() {
  int size = 5;
  
  List<List<double>> matrix = [];
  double maxValue = double.negativeInfinity; 

  for (int row = 0; row < size; row++) {
    matrix.add([]);

    for (int col = 0; col < size; col++) {
      double number = readDouble(
        "Write the number [${row + 1}][${col + 1}]: ",
      );
      
      matrix[row].add(number);
      
      if (number > maxValue) {
        maxValue = number;
      }
    }
  }

  matrix.forEach(print);
  print("$maxValue");

  for (int i = 0; i < size; i++) {
    matrix[i][i] = matrix[i][i] * maxValue;
  }

  matrix.forEach(print);
}