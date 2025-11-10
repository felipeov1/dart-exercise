import 'dart:io';

void main() {
  double initialPrice = 5.00;
  double minimumPrice = 1.00;
  double baseSales = 120.0;
  double expenses = 200.00;
  double salesIncreasePerReduction = 26.0;

  double maxProfit = -1.0; 
  double maxProfitPrice = 0.0;
  double maxProfitSales = 0.0;

  int reductionCount = 0;
  
  print("\n--- Expected Profit Table ---");
  print("| Price | Sales Quantity | Profit (R\$) |");
  print("|-------|----------------|--------------|");

  for (double currentPrice = initialPrice; currentPrice >= minimumPrice; currentPrice = currentPrice - 0.50) {
      
      double totalSales = baseSales + (reductionCount * salesIncreasePerReduction);
      
      double revenue = currentPrice * totalSales;
      
      double currentProfit = revenue - expenses;
      
      stdout.write("| R\$ ${currentPrice.toStringAsFixed(2)} ");
      stdout.write("| ${totalSales.toStringAsFixed(0).padLeft(14)} ");
      print("| R\$ ${currentProfit.toStringAsFixed(2).padLeft(9)} |");

      if (currentProfit > maxProfit) {
          maxProfit = currentProfit;
          maxProfitPrice = currentPrice;
          maxProfitSales = totalSales;
      }
      
      reductionCount += 1;
  }
}