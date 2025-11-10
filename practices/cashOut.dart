import 'dart:io';

double reads(String prompt) {
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
  double salary = reads("write the salary: ");

  double operationsQuantity = reads(
    "write the number of operations performed: ",
  );

  double totalOperationValue = 0.0;
  double totalTaxCost = 0.0;

  for (int i = 0; i < operationsQuantity; i++) {
    double currentOperationValue = reads(
      "write the value of operation ${i + 1}: ",
    );

    totalOperationValue += currentOperationValue;
    totalTaxCost += currentOperationValue * 0.0038;
  }

  double balance = salary - totalOperationValue - totalTaxCost;
  print(
    "The final balance after cash out operations is: ${balance.toStringAsFixed(2)}",
  );
}
