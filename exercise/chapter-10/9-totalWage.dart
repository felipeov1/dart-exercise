import '../reads.dart';

class totalWage {
  double fixedSalary;
  double totalSales;
  double commission = 0.0;
  double finalSalary = 0.0;

  totalWage(this.fixedSalary, this.totalSales);

  void calculate() {
    commission = totalSales * 0.06;
    finalSalary = fixedSalary + commission;
  }
}

void main() {
  double fixed = readDouble("write the fixed salary: ");
  double sales = readDouble("write the total sales value: ");

  totalWage wage = totalWage(fixed, sales);
  
  wage.calculate();

  print("Commission: ${wage.commission.toStringAsFixed(2)}");
  print("Final Salary: ${wage.finalSalary.toStringAsFixed(2)}");
}