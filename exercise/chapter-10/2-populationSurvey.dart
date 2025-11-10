import 'dart:io';
import '../reads.dart';

class Person {
  final double salary;
  final int age;
  final int children;
  final String gender;

  Person(this.salary, this.age, this.children, this.gender);
}

double readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? "");
    if (value != null && value >= 0) {
      return value;
    } else {
      print("write a positive number.");
    }
  }
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    int? value = int.tryParse(input ?? "");
    if (value != null && value >= 0) {
      return value;
    } else {
      print("write a positive integer.");
    }
  }
}

String readGender(String prompt) {
  while (true) {
    String sex = readString("What's your sex MALE(M) OR FEMALE(F)?");
    if (sex == 'M' || sex == 'F') {
      return sex;
    } else {
      print("write M or F.");
    }
  }
}

void main() {
  const int totalPeople = 20;
  List<Person> population = [];

  for (int i = 0; i < totalPeople; i++) {
    print("Data for Person ${i + 1}");

    double salary = readDouble("write salary: ");
    int age = readInt("write age: ");
    int children = readInt("write number of children: ");
    String gender = readGender("write gender (M/F): ");

    population.add(Person(salary, age, children, gender));
  }

  double totalSalary = 0;
  int totalChildren = 0;
  double maxSalary = 0;
  int highIncomeWomenCount = 0;
  int totalWomen = 0;

  for (Person person in population) {
    totalSalary += person.salary;
    totalChildren += person.children;

    if (person.salary > maxSalary) {
      maxSalary = person.salary;
    }

    if (person.gender == 'F') {
      totalWomen++;
      if (person.salary > 1000.00) {
        highIncomeWomenCount++;
      }
    }
  }

  double averageSalary = totalSalary / totalPeople;
  double averageChildren = totalChildren / totalPeople;

  double percentageWomenHighIncome = 0.0;
  if (totalWomen > 0) {
    percentageWomenHighIncome = (highIncomeWomenCount / totalWomen) * 100;
  }

  print("Total People Surveyed: $totalPeople");
  print("Average Salary: \$${averageSalary.toStringAsFixed(2)}");
  print("Average Number of Children: ${averageChildren.toStringAsFixed(2)}");
  print("Highest Salary: \$${maxSalary.toStringAsFixed(2)}");

  print("Women with Salary > \$1000.00: $highIncomeWomenCount");
  print(
    "Percentage of Women with Salary > \$1000.00 (Out of total women): ${percentageWomenHighIncome.toStringAsFixed(2)}%",
  );
}
