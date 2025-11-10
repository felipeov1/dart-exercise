import '../reads.dart';
import 'dart:io';

void main() {
  print("Operations Sytem: ");
  print("1 - Average between numbers");
  print("2 - Difference from higher to smaller");
  print("3 - Product between numbers");
  print("4 - Division from first by second number");
  print("Choose an option (1-4): ");
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      double number1 = readDouble("Write the first number: ");
      double number2 = readDouble("Write the second number: ");
      double average = (number1 + number2) / 2;
      print("The average between $number1 and $number2 is: $average");
      break;
    case '2':
      double number1 = readDouble("Write the first number: ");
      double number2 = readDouble("Write the second number: ");
      double difference = number1 > number2
          ? number1 - number2
          : number2 - number1;
      print("The difference from higher to smaller is: $difference");
      break;
    case '3':
      double number1 = readDouble("Write the first number: ");
      double number2 = readDouble("Write the second number: ");
      double product = number1 * number2;
      print("The product between $number1 and $number2 is: $product");
      break;
    case '4':
      double number1 = readDouble("Write the first number: ");
      double number2 = readDouble("Write the second number: ");
      if (number2 == 0) {
        print("Division by zero is not allowed.");
      } else {
        double division = number1 / number2;
        print("The division from $number1 by $number2 is: $division");
      }
      break;
    default:
      print("Invalid command, try again.");
  }
}
