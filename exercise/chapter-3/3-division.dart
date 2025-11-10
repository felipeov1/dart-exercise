import '../reads.dart';

void main() {
  double firstNumber = readDouble("write the first number: ");
  double secondNumber = readDouble("write the second number: ");

  if (secondNumber == 0) {
    print("Division by zero is not allowed.");
    return;
  }

  double result = firstNumber / secondNumber;

  print("The result of dividing $firstNumber by $secondNumber is: $result");
}
