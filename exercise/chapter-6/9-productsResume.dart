import '../reads.dart';

void main() {
  const int totalProducts = 10;
  List<String> productNames = [];
  List<int> productCodes = [];
  List<double> productPrices = [];

  for (int i = 0; i < totalProducts; i++) {
    String name = readString("Write the name for product ${i + 1}: ");
    int code = readInt("Write the code for product ${i + 1}: ");
    double price = readDouble("Write the price for product ${i + 1}: ");
    
    productNames.add(name);
    productCodes.add(code);
    productPrices.add(price);
  }

  print("Resume of Products with Price Increase");

  for (int i = 0; i < totalProducts; i++) {
    String name = productNames[i];
    int code = productCodes[i];
    double price = productPrices[i];
    double newPrice = price;
    double increaseRate = 0.0;

    bool isCodeEven = (code % 2 == 0);
    bool isPriceHigh = (price > 1000.00);

    if (isCodeEven && isPriceHigh) {
      increaseRate = 0.20;
    } else if (isCodeEven) {
      increaseRate = 0.15;
    } else if (isPriceHigh) {
      increaseRate = 0.10;
    }

    if (increaseRate > 0) {
      newPrice = price + (price * increaseRate);
      print("Name: $name, Code: $code, Old Price: ${price.toStringAsFixed(2)}, New Price: ${newPrice.toStringAsFixed(2)}");
    }
  }
}