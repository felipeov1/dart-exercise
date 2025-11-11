void main() {
  List<int> vectorA = [10, -5, 8, 0, -1, 22, -9, 3, 4, -12];

  List<int> vectorB = [];

  for (int number in vectorA) {
    
    if (number > 0) {
      vectorB.add(number);
    }
  }

  print("Vector A: $vectorA");
  print("Vector B: $vectorB");
}