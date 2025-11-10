import '../reads.dart';

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }

  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  
  return true;
}

void main() {
  int sumEven = 0;
  int sumPrime = 0;

  for (int i = 1; i <= 10; i++) {
    int number = readInt("Write the number $i: ");

    if (number % 2 == 0) {
      sumEven += number;
    }

    if (isPrime(number)) {
      sumPrime += number;
    }
  }

  print("Sum of even numbers: $sumEven");
  print("Sum of prime numbers: $sumPrime");
}