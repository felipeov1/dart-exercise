import '../reads.dart';

void main() {
  int investmentType = readInt("Write the investment type (1 - poupança, 2 - Fixed Income founds): ");
  double initialValue = readDouble("Write the investment value: ");

  double interestRate = 0.0;
  double finalValue = initialValue;

  if (investmentType == 1) {
    interestRate = 0.03;
    finalValue = initialValue + (initialValue * interestRate);
    print("The corrected value is: R\$${finalValue.toStringAsFixed(2)}");
  } else if (investmentType == 2) {
    interestRate = 0.04;
    finalValue = initialValue + (initialValue * interestRate);
    print("The corrected value is: R\$${finalValue.toStringAsFixed(2)}");
  } else {
    print("Invalid investment type.");
  }
}