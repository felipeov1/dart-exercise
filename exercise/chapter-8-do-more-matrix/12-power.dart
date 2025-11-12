import '../reads.dart';

void getPower(x, y) {
  double result = 0;
  for (int i = 0; i < y; i++) {
    result = x * x;
  }

  print(result);
}

void main() {
  double base = readDouble("Write the base: ");
  double exponent = readDouble("Write the exponent: ");

  getPower(base, exponent);
}
