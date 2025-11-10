import '../reads.dart';

void main() {
  double grossSalary = readDouble("Write the gross salary: ");
  
  double bonus = 0.0;

  if (grossSalary <= 350) {
    bonus = 100.0;
  } else if (grossSalary <= 600) {
    bonus = 75.0;
  } else if (grossSalary <= 900) {
    bonus = 50.0;
  } else {
    bonus = 35.0;
  }

  double tax = grossSalary * 0.07;
  double netSalary = grossSalary + bonus - tax;

  print("The net salary is: R\$${netSalary.toStringAsFixed(2)}");
}