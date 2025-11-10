import '../reads.dart';

void main() {
  double age = 0;
  double ageAverage = 0;
  int count = 1;

  do {
    age = readDouble("Write a age (or 0 to quit): ");
    if (age != 0) {
      ageAverage = (ageAverage + age) / count;
      print("Average: $ageAverage");
      count++;
    }
  } while (age != 0);
}
