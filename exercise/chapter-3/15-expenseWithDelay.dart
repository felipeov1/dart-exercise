import '../reads.dart';

double calculateExpenseWithDelay(int qntExpenses) {
  double totalAmountExpenseDelay = 0;

  for (int i = 1; i <= qntExpenses; i++) {
    double expenseValue = readDouble("write the value of expense $i: ");
    totalAmountExpenseDelay += expenseValue * 0.04;
  }
  return totalAmountExpenseDelay;
}

void main() {
  double salary = readDouble("write the monthly salary: ");
  int qntExpenses = readInt("write the quantity of expenses: ");

  salary = salary - calculateExpenseWithDelay(qntExpenses);

  print(
    "The salary after expenses with delay is: ${salary.toStringAsFixed(2)}",
  );
}
