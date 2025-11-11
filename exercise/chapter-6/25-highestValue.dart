void main() {
  List<int> originalVector = [2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 20, 15, 18, 0, 12];

  int highestValue = originalVector[0];

  for (int number in originalVector) {
    if (number > highestValue) {
      highestValue = number;
    }
  }

  List<double> resultVector = [];

  for (int number in originalVector) {
    double result = number / highestValue;
    resultVector.add(result);
  }

  print("Result: $resultVector");
}
