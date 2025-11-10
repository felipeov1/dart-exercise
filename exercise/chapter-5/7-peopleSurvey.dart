import '../reads.dart';

void main() {
  int countOver50 = 0;
  int countUnder40kg = 0;
  
  double totalHeightBetween10And20 = 0.0;
  int countHeightBetween10And20 = 0;

  int totalPeople = 5;

  for (int i = 1; i <= totalPeople; i++) {
    print("Person $i");
    int age = readInt("Enter age: ");
    double height = readDouble("Enter height: ");
    double weight = readDouble("Enter weight: ");

    if (age > 50) {
      countOver50++;
    }

    if (age >= 10 && age <= 20) {
      totalHeightBetween10And20 += height;
      countHeightBetween10And20++;
    }

    if (weight < 40) {
      countUnder40kg++;
    }
  }

  double averageHeight = 0.0;
  if (countHeightBetween10And20 > 0) {
    averageHeight = totalHeightBetween10And20 / countHeightBetween10And20;
  }

  double percentUnder40kg = (countUnder40kg / totalPeople) * 100;

  print("People over 50 years old: $countOver50");
  print("Average height (10-20 years): ${averageHeight.toStringAsFixed(2)} m");
  print("Percentage under 40kg: ${percentUnder40kg.toStringAsFixed(2)}%");
}