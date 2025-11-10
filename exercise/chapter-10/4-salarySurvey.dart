import '../reads.dart';

class Person {
  final int age;
  final String gender;
  final double familyIncome;
  final int children;

  Person(this.age, this.gender, this.familyIncome, this.children);
}

void main() {
  const int totalPeople = 20;
  List<Person> inhabitants = [];

  for (int i = 0; i < totalPeople; i++) {
    print("--- Data for Person ${i + 1} ---");

    int age = readInt("write age: ");
    String gender = readString("write gender (M/F): ");
    double familyIncome = readDouble("write family income: ");
    int children = readInt("write number of children: ");

    inhabitants.add(Person(age, gender, familyIncome, children));
  }

  double totalSalary = 0.0;
  int minAge = 999;
  int maxAge = -1;
  int specificWomenCount = 0;

  for (Person person in inhabitants) {
    totalSalary += person.familyIncome;

    if (person.age < minAge) {
      minAge = person.age;
    }

    if (person.age > maxAge) {
      maxAge = person.age;
    }

    if (person.gender == 'F') {
      if (person.children > 2 && person.familyIncome < 600.00) {
        specificWomenCount++;
      }
    }
  }
  double averageSalary = totalSalary / totalPeople;

  print("--- Survey Results ---");
  print("Average Salary: \$${averageSalary.toStringAsFixed(2)}");
  print("Lowest Age: $minAge");
  print("Highest Age: $maxAge");
  print("Women with > 2 children and Income < \$600.00: $specificWomenCount");
}
