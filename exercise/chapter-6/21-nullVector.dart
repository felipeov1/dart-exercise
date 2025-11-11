void main() {
  List<int> vector1 = [5, 0, 8, 12, 0, 7, -3, 0, 2, 9];

  List<int> vector2 = [];

  for (int number in vector1) {
    
    if (number == 0) {
      vector2.add(1);
    } else {
      vector2.add(number);
    }
  }

  print("vector 1: $vector1");
  print("vector 2: $vector2");
}