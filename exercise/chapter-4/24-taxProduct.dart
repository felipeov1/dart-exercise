import '../reads.dart';

void main() {
  double price = readDouble("Write the price: ");
  int category = readInt("Write the category (1-Clean, 2-Food, 3-Clothes): ");
  String situation = readString("Write the situation (R-Refrigeration, N-No Refrigeration): ");

  double increasePercentage = 0.0;
  double taxPercentage = 0.0;
  String classification = "";

  if (price <= 25) {
    if (category == 1) {
      increasePercentage = 0.05;
    } else if (category == 2) {
      increasePercentage = 0.08;
    } else if (category == 3) {
      increasePercentage = 0.10;
    }
  } else {
    if (category == 1) {
      increasePercentage = 0.12;
    } else if (category == 2) {
      increasePercentage = 0.15;
    } else if (category == 3) {
      increasePercentage = 0.18;
    }
  }

  double increaseAmount = price * increasePercentage;

  if (category == 2 || situation.toUpperCase() == 'R') {
    taxPercentage = 0.05;
  } else {
    taxPercentage = 0.08;
  }

  double taxAmount = price * taxPercentage;
  double newPrice = (price + increaseAmount) - taxAmount;

  if (newPrice <= 50) {
    classification = "cheap";
  } else if (newPrice < 120) {
    classification = "Normal";
  } else {
    classification = "Expense";
  }

  print("Increase amount: R\$${increaseAmount.toStringAsFixed(2)}");
  print("Tax amount: R\$${taxAmount.toStringAsFixed(2)}");
  print("New price: R\$${newPrice.toStringAsFixed(2)}");
  print("Classification: $classification");
}