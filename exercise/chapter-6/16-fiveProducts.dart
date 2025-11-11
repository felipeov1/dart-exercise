import '../reads.dart';

void main() {
  const int totalProducts = 5;
  
  int countBelow50 = 0;
  List<String> namesBetween50And100 = [];
  double sumAbove100 = 0.0;
  int countAbove100 = 0;

  for (int i = 0; i < totalProducts; i++) {
    String name = readString("Write the name for product ${i + 1}: ");
    double price = readDouble("Write the price for $name: ");

    if (price < 50.00) {
      countBelow50++;
    } else if (price >= 50.00 && price <= 100.00) {
      namesBetween50And100.add(name);
    } else if (price > 100.00) {
      sumAbove100 += price;
      countAbove100++;
    }
  }

  print("Quantity of products with price < 50.00: $countBelow50");
  
  print("Products with price between 50.00 and 100.00:");
  print(namesBetween50And100);

  if (countAbove100 == 0) {
    print("No products with price > 100.00.");
  } else {
    double averageAbove100 = sumAbove100 / countAbove100;
    print("Average price of products > 100.00: ${averageAbove100.toStringAsFixed(2)}");
  }
}