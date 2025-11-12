import '../reads.dart';

int sumDivisors(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }
  return sum;
}

void main() {
  int number = readInt("write a positive integer: ");

  if (number <= 0) {
    print("The number must be positive.");
  } else {
    int result = sumDivisors(number);
    print("The sum of the divisors of $number is: $result");
  }
}