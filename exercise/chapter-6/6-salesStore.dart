import '../reads.dart';

void main() {
  List<String> names = [];
  List<double> sales = [];
  List<double> commissionPercentage = [];
  List<double> commissionValue = [];
  double totalSalesEveryone = 0;

  int totalSalesPerson = readInt("write the number of salespersons: ");

  for (int i = 0; i < totalSalesPerson; i++) {
    String name = readString("write the name of salesperson ${i + 1}: ");
    names.add(name);

    double totalSale = readDouble("write the total sales of $name: ");
    sales.add(totalSale);
    totalSalesEveryone += totalSale;

    double percentage = readDouble(
      "write the commission percentage for $name: ",
    );
    commissionPercentage.add(percentage);

    double commission = totalSale * (percentage / 100);
    commissionValue.add(commission);
  }

  if (names.isEmpty) {
    print("No salesperson registered.");
    return;
  }

  double highestCommission = commissionValue.first;
  String highestName = names.first;
  double lowestCommission = commissionValue.first;
  String lowestName = names.first;

  for (int i = 0; i < names.length; i++) {
    print(
      "Salesperson: ${names[i]} | Commission: \$ ${commissionValue[i].toStringAsFixed(2)}",
    );

    if (commissionValue[i] > highestCommission) {
      highestCommission = commissionValue[i];
      highestName = names[i];
    }

    if (commissionValue[i] < lowestCommission) {
      lowestCommission = commissionValue[i];
      lowestName = names[i];
    }
  }
}
