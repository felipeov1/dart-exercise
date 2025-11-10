import '../reads.dart';

void main() {
  double weightKg = readDouble("write the weight in kilograms (kg): ");

  double weightGrams = weightKg * 1000;

  print("The weight in grams is: $weightGrams g");
}
