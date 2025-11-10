import '../reads.dart';

void main() {
  double totalCashSales = 0.0;
  double totalInstallmentSales = 0.0;

  for (int i = 1; i <= 15; i++) {
    print("Transaction $i");
    String code = readString("Write transaction code (V or P): ");
    double value = readDouble("Write transaction value: ");

    if (code.toUpperCase() == "V") {
      totalCashSales += value;
    } else if (code.toUpperCase() == "P") {
      totalInstallmentSales += value;
    } else {
      print("Write V or P.");
    }
  }

  double totalSales = totalCashSales + totalInstallmentSales;
  double firstInstallment = totalInstallmentSales / 3;

  print("Total cash sales: R\$${totalCashSales.toStringAsFixed(2)}");
  print("Total installment sales: R\$ ${totalInstallmentSales.toStringAsFixed(2)}");
  print("Total sales: R\$ ${totalSales.toStringAsFixed(2)}");
  print("First installment amount: R\$ ${firstInstallment.toStringAsFixed(2)}");
}