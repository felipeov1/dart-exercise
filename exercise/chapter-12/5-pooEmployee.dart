import '../reads.dart';

class Employee {
  int _employeeNumber;
  String _employeeName;
  String _role;
  double _salary;

  Employee({
    required int employeeNumber,
    required String employeeName,
    required String role,
    required double salary,
  }) : _employeeNumber = employeeNumber,
       _employeeName = employeeName,
       _role = role,
       _salary = salary;

  int get employeeNumber => _employeeNumber;
  set employeeNumber(int number) => _employeeNumber = number;

  String get employeeName => _employeeName;
  set employeeName(String name) => _employeeName = name;

  String get role => _role;
  set role(String role) => _role = role;

  double get salary => _salary;
  set salary(double salary) => _salary = salary;
}

class Dependent {
  Employee _employee;
  String _dependentName;

  Dependent({required Employee employee, required String dependentName})
    : _employee = employee,
      _dependentName = dependentName;

  Employee get employee => _employee;
  set employee(Employee emp) => _employee = emp;

  String get dependentName => _dependentName;
  set dependentName(String name) => _dependentName = name;
}

List<Employee> allEmployees = [];
List<Dependent> allDependents = [];

Employee? findEmployeeById(int id) {
  for (var emp in allEmployees) {
    if (emp.employeeNumber == id) {
      return emp;
    }
  }
  return null;
}

void registerEmployee() {
  int number = readInt("write employee number (must be unique):");

  if (findEmployeeById(number) != null) {
    print("mployee number $number already exists.");
    return;
  }

  String name = readString("write employee name:");
  String role = readString("write employee role:");
  double salary = readDouble("write employee salary:");

  Employee newEmployee = Employee(
    employeeNumber: number,
    employeeName: name,
    role: role,
    salary: salary,
  );

  allEmployees.add(newEmployee);

  print("Employee '${newEmployee.employeeName}' registered.");

  int depQty = readInt("write number of dependents for this employee :");

  for (int i = 0; i < depQty; i++) {
    print("Registering dependent ${i + 1}/$depQty...");
    String depName = readString("write dependent's name:");

    Dependent newDependent = Dependent(
      employee: newEmployee,
      dependentName: depName,
    );

    allDependents.add(newDependent);
  }
  print("Employee and $depQty dependents registered.");
}

void showBonus() {
  if (allEmployees.isEmpty) {
    print("No employees registered.");
    return;
  }

  for (var emp in allEmployees) {
    int dependentCount = 0;

    for (var dep in allDependents) {
      if (dep.employee == emp) {
        dependentCount++;
      }
    }

    double bonus = (emp.salary * 0.02) * dependentCount;

    print("Name: ${emp.employeeName}");
    print("Salary: R\$ ${emp.salary.toStringAsFixed(2)}");
    print("Dependents: $dependentCount");
    print("Bonus: R\$ ${bonus.toStringAsFixed(2)}");
  }
}

void deleteEmployee() {
  int id = readInt("write employee number to delete:");

  Employee? emp = findEmployeeById(id);

  if (emp == null) {
    print("Employee not found.");
    return;
  }

  allDependents.removeWhere((dep) => dep.employee.employeeNumber == id);

  allEmployees.removeWhere((e) => e.employeeNumber == id);

  print(
    "Employee ${emp.employeeName} and all related dependents were deleted.",
  );
}

void alterSalary() {
  int id = readInt("write employee number to alter:");

  Employee? emp = findEmployeeById(id);

  if (emp == null) {
    print("Employee not found.");
    return;
  }

  print("Employee found: ${emp.employeeName}");
  print("Current salary: R\$ ${emp.salary.toStringAsFixed(2)}");
  double newSalary = readDouble("write the NEW salary:");

  emp.salary = newSalary;

  print("Salary updated.");
  print("New salary: R\$ ${emp.salary.toStringAsFixed(2)}");
}

void main() {
  while (true) {
    print("1. Register Employee and dependents");
    print("2. Show Monthly Bonus");
    print("3. Delete Employee");
    print("4. Alter Employee Salary");
    print("5. Quit");
    String choice = readString("Choose an option:").toLowerCase();

    switch (choice) {
      case '1':
        registerEmployee();
        break;
      case '2':
        showBonus();
        break;
      case '3':
        deleteEmployee();
        break;
      case '4':
        alterSalary();
        break;
      case '5':
        print("Exited");
        return;
      default:
        print("Wrong option.");
    }
  }
}
