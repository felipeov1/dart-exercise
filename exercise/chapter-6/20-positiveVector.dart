void main() {
  List<int> numbers = [10, -5, 8, 0, -1, 22, -9, 3, 4, -12];

  print("Positive numbers: ");

  for (int number in numbers) {
    
    if (number > 0) {
      print(number);
    }
  }
}