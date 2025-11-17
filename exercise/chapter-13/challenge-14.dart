import '../reads.dart';

List<int> divisors(number) {
  List<int> divisorsNumber = [];

  for (int i = 1; i <= number; i++) {
    if (number % i == 0 && i != number) {
      divisorsNumber.add(i);
    }
  }

  print(divisorsNumber);
  return divisorsNumber;
}

void isFrendily(List<int> x, List<int> y) {
  int sumX = 0;
  int sumY = 0;

  for (int i = 0; i < x.length; i++) {
    sumX += x[i];
  }

  for (int j = 0; j < y.length; j++) {
    sumY += y[j];
  }

  print("First number $sumX");
  print('Second number $sumY');
}

void main() {
  int firstNumber = readInt("Write the first number: ");
  int secondNumber = readInt("Write the second number: ");

  List<int> divisorsOfFirst = divisors(firstNumber);
  List<int> divisorsOfSecond = divisors(secondNumber);

  isFrendily(divisorsOfFirst, divisorsOfSecond);
}
