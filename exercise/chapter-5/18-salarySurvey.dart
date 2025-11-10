import '../reads.dart';

void main() {
  double totalSalary = 0.0;
  int totalPeople = 0;

  int highestAge = 0;
  int lowestAge = 0;

  int womenLowSalary = 0;

  double lowestSalaryAmount = double.maxFinite;
  int lowestSalaryAge = 0;
  String lowestSalarySex = "";

  while (true) {
    int age = readInt("Write age (negative to finish): ");

    if (age < 0) {
      break;
    }

    String sex = readString("Write sex (M/F): ");
    double salary = readDouble("Write salary: ");

    totalPeople++;
    totalSalary += salary;

    if (totalPeople == 1) {
      highestAge = age;
      lowestAge = age;
    } else {
      if (age > highestAge) {
        highestAge = age;
      }
      if (age < lowestAge) {
        lowestAge = age;
      }
    }

    if (sex.toUpperCase() == 'F' && salary <= 200) {
      womenLowSalary++;
    }

    if (salary < lowestSalaryAmount) {
      lowestSalaryAmount = salary;
      lowestSalaryAge = age;
      lowestSalarySex = sex;
    }
  }

  if (totalPeople > 0) {
    double averageSalary = totalSalary / totalPeople;
    print("Average salary: R\$ ${averageSalary.toStringAsFixed(2)}");
    print("Highest age: $highestAge");
    print("Lowest age: $lowestAge");
    print("Women with salary <= 200: $womenLowSalary");
    print(
      "Person with lowest salary: Age: $lowestSalaryAge, Sex: $lowestSalarySex",
    );
  } else {
    print("Finished Program.");
  }
}
