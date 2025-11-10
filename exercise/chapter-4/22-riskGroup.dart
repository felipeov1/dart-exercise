import '../reads.dart';

void main() {
  int age = readInt("Write the age: ");
  double weight = readDouble("Write the weight (kg): ");
  
  int riskGroup = 0;

  if (age < 20) {
    if (weight <= 60) {
      riskGroup = 9;
    } else if (weight <= 90) {
      riskGroup = 8;
    } else {
      riskGroup = 7;
    }
  } else if (age <= 50) {
    if (weight <= 60) {
      riskGroup = 6;
    } else if (weight <= 90) {
      riskGroup = 5;
    } else {
      riskGroup = 4;
    }
  } else {
    if (weight <= 60) {
      riskGroup = 3;
    } else if (weight <= 90) {
      riskGroup = 2;
    } else {
      riskGroup = 1;
    }
  }

  print("THe risk group is: $riskGroup");
}