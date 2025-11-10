import '../reads.dart';

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});

  int calculateAgeInMonths() {
    return age * 12;
  }

  int calculateAgeIn2050() {
    int currentYear = DateTime.now().year;

    int yearsToPass = 2050 - currentYear;

    int futureAge = age + yearsToPass;

    return futureAge;
  }
}

void main() {
  print("write the person data:");
  String name = readString("write the name:");
  int age = readInt("write the current age:");

  Person person = Person(name: name, age: age);

  print("result ${person.name}");

  int ageInMonths = person.calculateAgeInMonths();
  print("Age in months: $ageInMonths months");

  int ageIn2050 = person.calculateAgeIn2050();
  print("Age in 2050: $ageIn2050 years old");
}
