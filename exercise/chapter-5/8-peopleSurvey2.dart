import '../reads.dart';

void main() {
  int totalPeople = 6;
  
  int countAgeWeight = 0;
  
  int totalAgeLowHeight = 0;
  int countLowHeight = 0;
  
  int countBlueEyes = 0;
  
  int countRedHairNoBlueEyes = 0;

  for (int i = 1; i <= totalPeople; i++) {
    print("Person $i");
    int age = readInt("Write the age: ");
    double weight = readDouble("Write the weight: ");
    double height = readDouble("Write the height: ");
    String eyeColor = readString("Write the eye color (A, P, V, C): ");
    String hairColor = readString("Write the hair color (P, C, L, R): ");

    if (age > 50 && weight < 60) {
      countAgeWeight++;
    }

    if (height < 1.50) {
      totalAgeLowHeight += age;
      countLowHeight++;
    }

    if (eyeColor.toUpperCase() == "A") {
      countBlueEyes++;
    }

    if (hairColor.toUpperCase() == "R" && eyeColor.toUpperCase() != "A") {
      countRedHairNoBlueEyes++;
    }
  }

  double averageAgeLowHeight = 0.0;
  if (countLowHeight > 0) {
    averageAgeLowHeight = totalAgeLowHeight / countLowHeight;
  }

  double percentBlueEyes = (countBlueEyes / totalPeople) * 100;

  print("People over 50 and under 60kg: $countAgeWeight");
  print("Average age (height < 1.50m): ${averageAgeLowHeight.toStringAsFixed(2)}");
  print("Percentage of blue eyes: ${percentBlueEyes.toStringAsFixed(2)}%");
  print("Red hair and no blue eyes: $countRedHairNoBlueEyes");
}