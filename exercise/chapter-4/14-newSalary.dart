import '../reads.dart';

void main() {
  double currentSalary = readDouble("Enter the current salary: R\$ ");
  
  double increasePercentage = 0.0;

  if (currentSalary <= 300) {
    increasePercentage = 0.50;
  } else if (currentSalary <= 500) {
    increasePercentage = 0.40;
  } else if (currentSalary <= 700) {
    increasePercentage = 0.30;
  } else if (currentSalary <= 800) {
    increasePercentage = 0.20;
  } else if (currentSalary <= 1000) {
    increasePercentage = 0.10;
  } else {
    increasePercentage = 0.05;
  }

  double newSalary = currentSalary + (currentSalary * increasePercentage);

  print("The new salary is: R\$${newSalary.toStringAsFixed(2)}");
}