import '../reads.dart';

double findSquareRoot(double number) {
  double low = 0;
  double high = number;

  for (int i = 0; i < 100; i++) {
    double mid = (low + high) / 2;
    if (mid * mid < number) {
      low = mid;
    } else {
      high = mid;
    }
  }

  return (high + low) / 2;
}

void calculateHypotenuse(sideA, sideB) {
  double hypotenuse;

  sideA *= sideA;
  sideB *= sideB;
  hypotenuse = sideA + sideB;

  hypotenuse = findSquareRoot(hypotenuse);

  print("The valeu of the hypotenuse is: ${hypotenuse.toStringAsFixed(2)}");
}

void main() {
  double sideA = readDouble("write the length of side A: ");
  double sideB = readDouble("write the length of side B: ");

  calculateHypotenuse(sideA, sideB);
}
