import '../reads.dart';

int sumUpToN(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

void main() {
  int number = readInt("write a positive integer: ");

  if (number < 1) {
    print("The number must be positive.");
  } else {
    int result = sumUpToN(number);
    print("The sum of numbers from 1 to $number is: $result");
  }
}