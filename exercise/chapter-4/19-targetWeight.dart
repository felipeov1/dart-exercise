import '../reads.dart';

void main() {
  double height = readDouble("Write your height: ");
  String sex = readString("Write your sex (M or F): ");

  double idealWeight = 0.0;

  if (sex.toUpperCase() == "M") {
    idealWeight = (72.7 * height) - 58;
    print("Your ideal weight is: ${idealWeight.toStringAsFixed(2)} kg");
  } else if (sex.toUpperCase() == "F") {
    idealWeight = (62.1 * height) - 44.7;
    print("Your ideal weight is: ${idealWeight.toStringAsFixed(2)} kg");
  } else {
    print("Write 'M' or 'F'.");
  }
}