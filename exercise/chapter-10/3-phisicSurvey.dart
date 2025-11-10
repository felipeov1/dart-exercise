import '../reads.dart';

class Person {
  final String gender;
  final double height;
  final int age;
  final String eyeColor;

  Person(this.gender, this.height, this.age, this.eyeColor);
}

void main() {
  const int totalPeople = 50;
  List<Person> inhabitants = [];

  for (int i = 0; i < totalPeople; i++) {
    print("--- Data for Person ${i + 1} ---");

    String gender = readString("write gender (M/F): ");
    double height = readDouble("write height (m): ");
    int age = readInt("write age: ");
    String eyeColor = readString("write eye color (A/V/C): ");

    inhabitants.add(Person(gender, height, age, eyeColor));
  }

  int brownEyesCount = 0;
  int brownEyesTotalAge = 0;

  int maxAge = -1;

  int specificFemaleCount = 0;

  int maleCount = 0;

  for (Person person in inhabitants) {
    if (person.age > maxAge) {
      maxAge = person.age;
    }

    if (person.eyeColor == 'C' && person.height > 1.60) {
      brownEyesCount++;
      brownEyesTotalAge += person.age;
    }

    if (person.gender == 'F') {
      if (person.age >= 20 && person.age <= 45 ||
          person.eyeColor == 'V' && person.height < 1.70) {
        specificFemaleCount++;
      }
    }

    if (person.gender == 'M') {
      maleCount++;
    }
  }

  double averageAgeBrownEyes = 0.0;
  if (brownEyesCount > 0) {
    averageAgeBrownEyes = brownEyesTotalAge / brownEyesCount;
  }

  double malePercentage = (maleCount / totalPeople) * 100;

  print("--- Survey Results ---");
  print("Total People Surveyed: $totalPeople");

  print(
    "1. Average Age (Brown Eyes and Height > 1.60m): ${averageAgeBrownEyes.toStringAsFixed(2)}",
  );
  print("2. Highest Age: $maxAge");
  print(
    "3. Specific Female (Age 20-45 OR Green Eyes & Height < 1.70m): $specificFemaleCount",
  );
  print("4. Percentage of Men: ${malePercentage.toStringAsFixed(2)}%");
}
