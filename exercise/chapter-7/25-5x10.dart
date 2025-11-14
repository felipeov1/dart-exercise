import '../reads.dart';

void main() {
  int numProducts = 10;
  int numWarehouses = 5;

  List<double> prices = [];
  List<List<int>> stock = [];

  for (int i = 0; i < numProducts; i++) {
    double price = readDouble("write price for product ${i + 1}: ");
    prices.add(price);
  }

  for (int w = 0; w < numWarehouses; w++) {
    stock.add([]);
    print("Warehouse ${w + 1}");
    for (int p = 0; p < numProducts; p++) {
      int quantity = readInt("write stock for product ${p + 1}: ");
      stock[w].add(quantity);
    }
  }

  List<int> stockPerWarehouse = List.filled(numWarehouses, 0);
  List<int> stockPerProduct = List.filled(numProducts, 0);
  List<double> costPerWarehouse = List.filled(numWarehouses, 0.0);
  
  int largestStock = stock[0][0];
  int productIndexOfLargest = 0;
  int smallestStock = stock[0][0];

  for (int w = 0; w < numWarehouses; w++) {
    for (int p = 0; p < numProducts; p++) {
      int currentStock = stock[w][p];
      double currentPrice = prices[p];

      stockPerWarehouse[w] += currentStock;
      stockPerProduct[p] += currentStock;
      costPerWarehouse[w] += currentStock * currentPrice;

      if (currentStock > largestStock) {
        largestStock = currentStock;
        productIndexOfLargest = p;
      }

      if (currentStock < smallestStock) {
        smallestStock = currentStock;
      }
    }
  }

  for (int w = 0; w < numWarehouses; w++) {
    print("Total stock ${w + 1}: ${stockPerWarehouse[w]}");
  }

  print("\n");
  for (int p = 0; p < numProducts; p++) {
    print("Total stock for product ${p + 1}: ${stockPerProduct[p]}");
  }

  print("Price of the product with largest stock: ${prices[productIndexOfLargest]}");
  
  print("Smallest stock stored: $smallestStock");

  for (int w = 0; w < numWarehouses; w++) {
    print("Total cost of warehouse ${w + 1}: ${costPerWarehouse[w].toStringAsFixed(2)}");
  }
}