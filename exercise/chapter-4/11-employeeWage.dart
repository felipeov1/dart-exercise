import '../reads.dart';

void main() {
  double currentSalary = readDouble("Write the current salary: ");
  
  double increasePercentage = 0.0;

  if (currentSalary <= 300) {
    increasePercentage = 0.15;
  } else if (currentSalary <= 600) {
    increasePercentage = 0.10;
  } else if (currentSalary <= 900) {
    increasePercentage = 0.05;
  } else {
    increasePercentage = 0.0;
  }

  double increaseAmount = currentSalary * increasePercentage;
  double newSalary = currentSalary + increaseAmount;

  print("The increase amount is: R\$${increaseAmount.toStringAsFixed(2)}");
  print("The new salary is: R\$${newSalary.toStringAsFixed(2)}");
}