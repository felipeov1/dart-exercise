import '../reads.dart';

void main() {
  int option;

  do {
    print("1. New salary");
    print("2. Vacation");
    print("3. Thirteenth salary");
    print("4. Exit");
    
    option = readInt("Write your choice: ");

    switch (option) {
      case 1:
        double currentSalary = readDouble("Write the current salary: ");
        double newSalary;
        double increasePercentage;

        if (currentSalary <= 210.00) {
          increasePercentage = 0.15;
        } else if (currentSalary <= 600.00) {
          increasePercentage = 0.10;
        } else {
          increasePercentage = 0.05;
        }
        
        newSalary = currentSalary + (currentSalary * increasePercentage);
        print("The new salary is: ${newSalary.toStringAsFixed(2)}");
        break;

      case 2:
        double salary = readDouble("Write the salary: ");
        double vacationPay = salary + (salary / 3.0);
        print("The vacation pay is: ${vacationPay.toStringAsFixed(2)}");
        break;

      case 3:
        double salary = readDouble("Write the salary: ");
        int monthsWorked = readInt("Write the number of months worked (max 12): ");

        if (monthsWorked > 12) {
          monthsWorked = 12;
        }
        if (monthsWorked < 1) {
          monthsWorked = 1;
        }

        double thirteenthSalary = (salary * monthsWorked) / 12.0;
        print("The thirteenth salary is: ${thirteenthSalary.toStringAsFixed(2)}");
        break;

      case 4:
        print("Finished program.");
        break;

      default:
        print("Invalid option.");
    }

  } while (option != 4);
}