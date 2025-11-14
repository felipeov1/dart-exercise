import '../reads.dart';

class Job {
  final int jobCode;
  double salary;

  Job(this.jobCode, this.salary);
}

class Employee {
  final int employeeCode;
  String name;
  final int jobCode;

  Employee(this.employeeCode, this.name, this.jobCode);
}

List<Job> jobs = [];
List<Employee> employees = [];
const int maxJobs = 5;
const int maxEmployees = 15;

int findJob(int code) {
  for (int i = 0; i < jobs.length; i++) {
    if (jobs[i].jobCode == code) {
      return i;
    }
  }
  return -1;
}

int findEmployee(int code) {
  for (int i = 0; i < employees.length; i++) {
    if (employees[i].employeeCode == code) {
      return i;
    }
  }
  return -1; 
}

bool isValidName(String name) {
  String cleanedName = name.trim().replaceAll(RegExp(r'\s+'), ' ');
  return cleanedName.split(' ').length >= 2;
}

double getSalary(int jobCode) {
  int index = findJob(jobCode);
  if (index != -1) {
    return jobs[index].salary;
  }
  return 0.0;
}

void registerJobs() {
  if (jobs.length >= maxJobs) {
    print("Job salaries already registered.");
    return;
  }

  for (int i = 0; i < maxJobs; i++) {
    int code = i + 1;
    double salary = readDouble("write salary for job code $code: ");
    jobs.add(Job(code, salary));
  }
  print("Jobs registered");
}

void registerEmployee() {
  if (jobs.isEmpty) {
    print("Register jobs first (Option 1).");
    return;
  }
  if (employees.length >= maxEmployees) {
    print("Max employees already registered.");
    return;
  }

  print("Registering Employee ${employees.length + 1}");
  int code = readInt("write employee code: ");
  if (findEmployee(code) != -1) {
    print("Employee code exists.");
    return;
  }

  String name = readString("write employee name (first and last): ");
  if (!isValidName(name)) {
    print("Must have at least two names.");
    return;
  }

  int jobCode = readInt("write job code (1-5): ");
  if (findJob(jobCode) == -1) {
    print("Job code not found.");
    return;
  }

  employees.add(Employee(code, name, jobCode));
  print("Employee added.");
}

void showReport() {
  if (employees.isEmpty) {
    print("No employees registered.");
    return;
  }

  print("Employee Report");
  for (Employee f in employees) {
    double salary = getSalary(f.jobCode);
    print(
      "Code: ${f.employeeCode}, Name: ${f.name}, Salary: ${salary.toStringAsFixed(2)}",
    );
  }
}

void showTotalByJob() {
  if (jobs.isEmpty) {
    print("No jobs registered.");
    return;
  }

  int jobCode = readInt("write job code (1-5) to consult: ");
  if (findJob(jobCode) == -1) {
    print("Job code not found.");
    return;
  }

  double totalSalary = 0;
  for (Employee f in employees) {
    if (f.jobCode == jobCode) {
      totalSalary += getSalary(f.jobCode);
    }
  }

  print(
      "Total salary for job code $jobCode: ${totalSalary.toStringAsFixed(2)}");
}

void main() {
  int option = 0;
  do {
    print("1. Register Company Jobs");
    print("2. Register Company Employees");
    print("3. Show Report");
    print("4. Show Total Paid by Job");
    print("5. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        registerJobs();
        break;
      case 2:
        registerEmployee();
        break;
      case 3:
        showReport();
      case 4:
        showTotalByJob();
        break;
      case 5:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 5);
}
