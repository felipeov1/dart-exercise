import '../reads.dart';

void main() {
  double currentPrice = readDouble("Write the product price: ");
  
  double increasePercentage = 0.0;
  
  if (currentPrice <= 50) {
    increasePercentage = 0.05;
  } else if (currentPrice <= 100) {
    increasePercentage = 0.10;
  } else {
    increasePercentage = 0.15;
  }

  double newPrice = currentPrice + (currentPrice * increasePercentage);

  String classification = "";

  if (newPrice <= 80) {
    classification = "Cheap";
  } else if (newPrice <= 120) {
    classification = "Normal";
  } else if (newPrice <= 200) {
    classification = "Expensive";
  } else {
    classification = "Very Expensive";
  }

  print("The new price is: R\$${newPrice.toStringAsFixed(2)}");
  print("The classification is: $classification");
}