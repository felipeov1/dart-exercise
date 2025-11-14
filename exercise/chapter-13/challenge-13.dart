import 'dart:math';
import '../reads.dart';

bool isNarcissistic(int number) {
  String numString = number.toString();
  int totalDigits = numString.length;
  int sum = 0;

  for (int i = 0; i < totalDigits; i++) {
    int digit = int.parse(numString[i]);
    sum += pow(digit, totalDigits).toInt();
  }

  return sum == number;
}

void main() {
  while (true) {
    int number = readInt("write a number (or 0 to exit): ");
    
    if (number == 0) {
      print("Exited");
      break;
    }
    
    if (number < 0) {
      print("Please write a positive number.");
      continue;
    }

    if (isNarcissistic(number)) {
      print("$number is Narcissistic.");
    } else {
      print("$number is not Narcissistic.");
    }
  }
}

