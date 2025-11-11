import '../reads.dart';

void main() {
  const int totalNumbers = 5;
  List<int> numbers = [];
  int totalSum = 0;
  List<String> prompts = [
    "Write the 1st number: ",
    "Write the 2nd number: ",
    "Write the 3rd number: ",
    "Write the 4th number: ",
    "Write the 5th number: "
  ];

  for (int i = 0; i < totalNumbers; i++) {
    int value = readInt(prompts[i]);
    numbers.add(value);
    totalSum += value;
  }

  String numbersString = numbers.join(' + ');
  print("The typed numbers were: $numbersString = $totalSum");
}