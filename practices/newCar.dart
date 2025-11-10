import 'dart:io';

double reads(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? "");

    if (value != null) {
      return value;
    } else {
      print("Invalid input. Please write a number.");
    }
  }
}

double calculateDistributorCost(
  double factoryPrice,
  double distributorPercentage,
) {
  return factoryPrice * (distributorPercentage / 100);
}

double calculateTaxCost(double factoryPrice, double taxPercentage) {
  return factoryPrice * (taxPercentage / 100);
}

void main() {
  double factoryPrice = reads("write the factory price: ");

  double distributorPercentage = reads("write the distributor percentage: ");

  double taxPercentage = reads("write the tax percentage: ");

  double distributorCost = calculateDistributorCost(
    factoryPrice,
    distributorPercentage,
  );

  double taxCost = calculateTaxCost(factoryPrice, taxPercentage);

  double finalPrice = factoryPrice + distributorCost + taxCost;

  print("*Distributor: $distributorCost");
  print("*Tax value: $taxCost");
  print("*Final vehicle price: $finalPrice");
}
