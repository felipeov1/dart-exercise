import 'dart:io';

import '../reads.dart';

void main() {
  double firstNumber = readDouble("write the first number: ");
  double secondNumber = readDouble("write the second number: ");
  double? thirdNumber;
  double result;

  readDouble("Do you want to write a third number? (Y or N) ");
  if (stdin.readLineSync()?.toUpperCase() == 'Y') {
    double thirdNumber = readDouble("write the third number: ");
  }

  if (thirdNumber != null) {
    result = firstNumber - secondNumber - thirdNumber;
    print(
      "The result of subtracting $secondNumber and $thirdNumber from $firstNumber is: $result",
    );
    return;
  }

  result = secondNumber - firstNumber;

  print(
    "The result of subtracting $firstNumber from $secondNumber is: $result",
  );
}
