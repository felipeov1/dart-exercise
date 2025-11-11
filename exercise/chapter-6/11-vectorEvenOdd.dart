import '../reads.dart';

void main() {
  const int totalNumbers = 10;
  List<int> evenNumbers = [];
  List<int> oddNumbers = [];

  for (int i = 0; i < totalNumbers; i++) {
    int value = readInt("Write integer number ${i + 1}: ");
    
    if (value % 2 == 0) {
      evenNumbers.add(value);
    } else {
      oddNumbers.add(value);
    }
  }

  print("Even numbers vector: $evenNumbers");
  
  print("Odd numbers vector: $oddNumbers");
}