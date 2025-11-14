import '../reads.dart';

List<int> codes = [];
List<double> salaries = [];
List<int> serviceYears = [];
const int maxEmployees = 5;

void loadEmployees() {
  for (int i = 0; i < maxEmployees; i++) {
    print("Employee ${i + 1}");
    int code = readInt("write code: ");
    double salary = readDouble("write salary: ");
    int years = readInt("write service years: ");

    codes.add(code);
    salaries.add(salary);
    serviceYears.add(years);
  }
  print("Employees loaded.");
}

void showSalaryReports() {
  if (codes.isEmpty) {
    print("Load employees first.");
    return;
  }

  double consultSalary = readDouble("write salary value to consult: ");

  bool foundBelow = false;
  print("Employees with salary <= $consultSalary:");
  for (int i = 0; i < salaries.length; i++) {
    if (salaries[i] <= consultSalary) {
      print("Code: ${codes[i]}, Salary: ${salaries[i]}");
      foundBelow = true;
    }
  }
  if (!foundBelow) {
    print("No employee found in this range.");
  }

  bool foundAbove = false;
  print("Employees with salary > $consultSalary:");
  for (int i = 0; i < salaries.length; i++) {
    if (salaries[i] > consultSalary) {
      print("Code: ${codes[i]}, Salary: ${salaries[i]}");
      foundAbove = true;
    }
  }
  if (!foundAbove) {
    print("No employee found in this range.");
  }
}

void showMinSalaryReport() {
  if (codes.isEmpty) {
    print("Load employees first.");
    return;
  }

  double minSalary = double.infinity;
  for (double s in salaries) {
    if (s < minSalary) {
      minSalary = s;
    }
  }

  List<int> minSalaryCodes = [];
  for (int i = 0; i < salaries.length; i++) {
    if (salaries[i] == minSalary) {
      minSalaryCodes.add(codes[i]);
    }
  }

  print("Lowest salary paid: $minSalary");
  print("Quantity of employees: ${minSalaryCodes.length}");
  print("Codes of these employees: $minSalaryCodes");
}

void generateTaxReport() {
  if (codes.isEmpty) {
    print("Load employees first.");
    return;
  }

  List<int> taxExemptCodes = [];
  for (int i = 0; i < codes.length; i++) {
    bool inRange = serviceYears[i] >= 2 && serviceYears[i] <= 4;
    bool lowSalary = salaries[i] < 1500.00;

    if (inRange && lowSalary) {
      taxExemptCodes.add(codes[i]);
    }
  }

  if (taxExemptCodes.isEmpty) {
    print("No employee meets the requirements.");
  } else {
    print("Tax employee codes: $taxExemptCodes");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Load Employees (5)");
    print("2. Salary Reports");
    print("3. Min Salary Report");
    print("4. Tax Report");
    print("5. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        loadEmployees();
        break;
      case 2:
        showSalaryReports();
        break;
      case 3:
        showMinSalaryReport();
        break;
      case 4:
        generateTaxReport();
        break;
      case 5:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 5);
}