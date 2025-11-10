import 'dart:io';
import 'dart:math' as Math;

double reads(String prompt) {
  while (true) {
    stdout.write(prompt);

    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? "");

    if (value != null) {
      return value;
    } else {
      print("Invalid input. Please write a number.");
    }
  }
}

void main() {
  print("(Two equal sides and one different base)");

  double equalSide = reads("write the length of the two equal sides: ");
  double base = reads("write the length of the base: ");

  double perimeter = (equalSide * 2) + base;

  print("The perimeter of the triangle is: $perimeter");

  double area =
      (base * (Math.sqrt(equalSide * equalSide - (base * base) / 4))) / 2;

  print("The area of the triangle is: $area");
}
