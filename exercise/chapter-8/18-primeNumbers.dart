bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void findFirstThreePrimes() {
  int count = 0;
  int number = 101; 

  while (count < 3) {
    if (isPrime(number)) {
      print(number);
      count++;
    }
    number++;
  }
}

void main() {
  findFirstThreePrimes();
}