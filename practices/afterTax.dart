import 'dart:io';

double calculateAfterTax(double salary) {
  double tax, gratification;

  tax = salary * 0.07;
  gratification = salary * 0.05;

  return salary + gratification - tax;
}

double readSalary(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? "");

    if (value != null) {
      return value;
    } else {
      print("Invalid input. Please write a number.");
    }
  }
}

void main() {
  double salary = readSalary("write the salary: ");
  double afterTaxSalary = calculateAfterTax(salary);
  print("The salary after tax and gratification is: $afterTaxSalary");
}
