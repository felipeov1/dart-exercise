import '../reads.dart';

void main() {
  int productCode = readInt("Write the product code: ");
  int qty = readInt("Write the quantity bought: ");
  
  double unitPrice = 0.0;
  double discountPercentage = 0.0;
  double finalPrice = 0.0;

  if (productCode >= 1 && productCode <= 10) {
    unitPrice = 10.0;
  } else if (productCode <= 20) {
    unitPrice = 15.0;
  } else if (productCode <= 30) {
    unitPrice = 20.0;
  } else if (productCode <= 40) {
    unitPrice = 30.0;
  } else {
    print("Invalid product code.");
    return;
  }

  double totalPrice = unitPrice * qty;

  if (totalPrice <= 250) {
    discountPercentage = 0.05;
  } else if (totalPrice <= 500) {
    discountPercentage = 0.10;
  } else {
    discountPercentage = 0.15;
  }

  double discountAmount = totalPrice * discountPercentage;
  finalPrice = totalPrice - discountAmount;

  print("Unit price: R\$${unitPrice.toStringAsFixed(2)}");
  print("Total price: R\$${totalPrice.toStringAsFixed(2)}");
  print("Discount amount:R\$ ${discountAmount.toStringAsFixed(2)}");
  print("Final price: R\$${finalPrice.toStringAsFixed(2)}");
}