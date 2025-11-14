import '../reads.dart';

double resultSsequence(numQntd) {
  double s = 0;

  for (int i = 1; i <= numQntd; i++) {
    s = s + 1 / i;
  }

  return s;
}

void main() {
  int number = readInt("Choose a integer number: ");
  if (number < 1) {
    int number = readInt("The number must to be equal or more bigger than 1: ");
  }

  print(resultSsequence(number).toStringAsFixed(2));
}

