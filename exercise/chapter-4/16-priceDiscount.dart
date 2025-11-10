import '../reads.dart';

void main() {
  double currentPrice = readDouble("Write the current price: ");
  int productCode = readInt("Write the product code: ");

  double discountPercentage = 0.0;

  if (currentPrice <= 30) {
    discountPercentage = 0.0;
  } else if (currentPrice <= 100) {
    discountPercentage = 0.10;
  } else {
    discountPercentage = 0.15;
  }

  double discountAmount = currentPrice * discountPercentage;
  double newPrice = currentPrice - discountAmount;

  print("Product: $productCode");
  print("The discount amount is: R\$${discountAmount.toStringAsFixed(2)}");
  print("The new price is: R\$${newPrice.toStringAsFixed(2)}");
}
