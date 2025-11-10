import 'reads.dart';

double calculateKwPrice(double minimumSalary) {
  return minimumSalary / 5;
}

void main() {
  double minimumSalary = readDouble("write the minimum salary: ");
  double kwConsumed = readDouble("write the kW consumed: ");

  double kwPrice = calculateKwPrice(minimumSalary);

  double totalCost = kwConsumed * kwPrice;

  print(totalCost);

  double totalCostWithDiscount = totalCost - (totalCost * 0.15);

  print("The value per kW is: ${kwPrice.toStringAsFixed(2)}");
  print("The total cost without discount is: ${totalCost.toStringAsFixed(2)}");
  print(
    "The total cost with discount is: ${totalCostWithDiscount.toStringAsFixed(2)}",
  );
}
