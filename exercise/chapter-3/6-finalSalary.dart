import '../reads.dart';

void main() {
  double initialSalary = readDouble("write the initial salary: ");
  double salesAmount = readDouble("write the amaount of sales made: ");
  double comissionPerSale = readDouble("write the commission per sale: ");

  double totalComission = salesAmount * (comissionPerSale / 100);

  double finalSalary = initialSalary + totalComission;

  print("The final salary is: $finalSalary");
}
