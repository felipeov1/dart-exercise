import '../reads.dart';
import 'dart:math';
import 'dart:io';

double calculatePotence(double base, double exponent) {
  double result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

double calculateSquareRoot(double number) {
  double low = 0;
  double high = number;

  for (int i = 0; i < 100; i++) {
    double mid = (low + high) / 2;
    if (mid * mid < number) {
      low = mid;
    } else {
      high = mid;
    }
  }
  return (high + low) / 2;
}

double calculateCubeRoot(double number) {
  return pow(number, 1 / 3).toDouble();
}

void main() {
  double number1 = readDouble("Write the first number: ");
  double number2 = readDouble("Write the second number: ");

  print("Choose the operation:");
  print("a) The first number raised to the second number.");
  print("b) Square root of each number.");
  print("c) Cube root of each number.");

  stdout.write("write your choice (a, b, or c): ");
  String? choice = stdin.readLineSync()?.toLowerCase();

  switch (choice) {
    case 'a':
      double potenceResult = calculatePotence(number1, number2);
      print("Result: ${number1} raised to the ${number2} is: ${potenceResult}");
      break;
    case 'b':
      double rootNumber1 = calculateSquareRoot(number1);
      double rootNumber2 = calculateSquareRoot(number2);
      print("Result:");
      print("Square root of ${number1} is: ${rootNumber1.toStringAsFixed(2)}");
      print("Square root of ${number2} is: ${rootNumber2.toStringAsFixed(2)}");
      break;
    case 'c':
      double rootCubeNumber1 = calculateCubeRoot(number1);
      double rootCubeNumber2 = calculateCubeRoot(number2);
      print("\nResult:");
      print(
        "Cube root of ${number1} is: ${rootCubeNumber1.toStringAsFixed(2)}",
      );
      print(
        "Cube root of ${number2} is: ${rootCubeNumber2.toStringAsFixed(2)}",
      );
      break;
    default:
      print("\nInvalid option. The program will terminate.");
  }
}
