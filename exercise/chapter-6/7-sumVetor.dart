import 'dart:math';

List<double> realNumbers() {
  var randomGenerator = Random();

  List<double> realRandomNumbers = [];

  const double min = -10;
  const double range = 50;

  for (int i = -5; i < 5; i++) {
    double r = randomGenerator.nextDouble() * range + min;

    realRandomNumbers.add(r);
  }

  return realRandomNumbers;
}

void main() {
  List<double> realRandomNumbers = realNumbers();
  print(realRandomNumbers);
  int qntdNegative = 0;
  double sumPositive = 0;

  for (int i = 0; i < realRandomNumbers.length; i++) {
    if (realRandomNumbers[i] < 0) {
      qntdNegative += 1;
    } else if (realRandomNumbers[i] > 0) {
      sumPositive = sumPositive + realRandomNumbers[i];
      
    }
  }

  print(sumPositive);
  print(qntdNegative);
}
