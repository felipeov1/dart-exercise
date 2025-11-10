import '../reads.dart';

void main() {
  double productPrice = readDouble("write the product price: ");
  double discountPercentage = readDouble("write the discount percentage: ");

  double finalPrice = productPrice - (productPrice * discountPercentage / 100);

  print(
    "The final price after a discount of $discountPercentage% is: $finalPrice",
  );
}
