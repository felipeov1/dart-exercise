import '../reads.dart';

void main() {
  double factoryCost = readDouble("Write the car factory cost: ");

  double distributorPercentage = 0.0;
  double taxPercentage = 0.0;

  if (factoryCost <= 12000) {
    distributorPercentage = 0.05;
    taxPercentage = 0.0;
  } else if (factoryCost <= 25000) {
    distributorPercentage = 0.10;
    taxPercentage = 0.15;
  } else {
    distributorPercentage = 0.15;
    taxPercentage = 0.20;
  }

  double distributorAmount = factoryCost * distributorPercentage;
  double taxAmount = factoryCost * taxPercentage;
  double consumerPrice = factoryCost + distributorAmount + taxAmount;

  print("The consumer price is: R\$${consumerPrice.toStringAsFixed(2)}");
}