import '../reads.dart';

int calculateFactorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

void main() {
  int number = readInt("write a positive integer: ");

  if (number <= 0) {
    print("The number must be positive.");
  } else {
    int factorial = calculateFactorial(number);
    print("The factorial of $number is: $factorial");
  }
}