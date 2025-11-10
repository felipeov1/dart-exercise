import 'dart:io';

void main() {
  stdout.write("write the minimum wage: ");
  double minimumWage = double.parse(stdin.readLineSync()!);

  stdout.write("write the employee salary: ");
  double employeeSalary = double.parse(stdin.readLineSync()!);

  double amount = employeeSalary / minimumWage;

  print("The employee earns ${amount.toStringAsFixed(2)} minimum wages.");
}
