import '../reads.dart';

void main() {
  int totalPeople = 10;
  
  int totalAge = 0;
  int countWeightHeight = 0;
  
  int countTallPeople = 0;
  int countTallAndYoung = 0;

  for (int i = 1; i <= totalPeople; i++) {
    print("Person $i");
    int age = readInt("Write the age: ");
    double weight = readDouble("Write the weight: ");
    double height = readDouble("Write the height: ");

    totalAge += age;

    if (weight > 90 && height < 1.50) {
      countWeightHeight++;
    }

    if (height > 1.90) {
      countTallPeople++;
      if (age >= 10 && age <= 30) {
        countTallAndYoung++;
      }
    }
  }

  double averageAge = totalAge / totalPeople;
  
  double percentTallAndYoung = 0.0;
  if (countTallPeople > 0) {
    percentTallAndYoung = (countTallAndYoung / countTallPeople) * 100;
  }

  print("Average age: ${averageAge.toStringAsFixed(2)} years");
  print("Count (Weight > 90kg and Height < 1.50m): $countWeightHeight");
  print("Percentage (Age 10-30 among people > 1.90m): ${percentTallAndYoung.toStringAsFixed(2)}%");
}