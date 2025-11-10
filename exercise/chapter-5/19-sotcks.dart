import '../reads.dart';

void main() {
  String stockType = '';
  double totalProfit = 0;
  int profitableStocksCount = 0;
  int lowProfitStocksCount = 0;

  while (true) {
    String stockType = readString("Write the stock type (F to finish): ");

    if (stockType == 'F') {
      break;
    }

    double purchasePrice = readDouble("Write the purchase price: ");

    double salePrice = readDouble("Write the sale price: ");

    double profit = salePrice - purchasePrice;
    totalProfit += profit;

    print("Stock profit: ${profit.toStringAsFixed(2)}");

    if (profit > 1000) {
      profitableStocksCount++;
    }

    if (profit < 200) {
      lowProfitStocksCount++;
    }
  }

  print("Stocks with profit > 1000.00: $profitableStocksCount");
  print("Stocks with profit < 200.00: $lowProfitStocksCount");
  print("Total company profit: ${totalProfit.toStringAsFixed(2)}");
}