import '../reads.dart';

void main() {
  int totalPeople = 15;
  
  int totalAgeGreat = 0;
  int countGreat = 0;
  
  int countRegular = 0;
  int countGood = 0;

  for (int i = 1; i <= totalPeople; i++) {
    print("Spectator $i");
    int age = readInt("Write the age: ");
    int opinion = readInt("Write the opinion (3-Great, 2-Good, 1-Regular): ");

    if (opinion == 3) {
      totalAgeGreat += age;
      countGreat++;
    } else if (opinion == 1) {
      countRegular++;
    } else if (opinion == 2) {
      countGood++;
    }
  }

  double averageAgeGreat = 0.0;
  if (countGreat > 0) {
    averageAgeGreat = totalAgeGreat / countGreat;
  }
  
  double percentGood = (countGood / totalPeople) * 100;

  print("Average age of 'Great': ${averageAgeGreat.toStringAsFixed(2)}");
  print("Percentage of 'Good': ${percentGood.toStringAsFixed(2)}%");
}