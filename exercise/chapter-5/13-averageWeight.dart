import '../reads.dart';

void main() {
  int totalPeople = 15;

  double totalWeight1to10 = 0.0;
  int count1to10 = 0;
  
  double totalWeight11to20 = 0.0;
  int count11to20 = 0;
  
  double totalWeight21to30 = 0.0;
  int count21to30 = 0;

  double totalWeight31plus = 0.0;
  int count31plus = 0;

  for (int i = 1; i <= totalPeople; i++) {
    print("Person $i");
    int age = readInt("Write the age: ");
    double weight = readDouble("Write the weight: ");

    if (age >= 1 && age <= 10) {
      totalWeight1to10 += weight;
      count1to10++;
    } else if (age <= 20) {
      totalWeight11to20 += weight;
      count11to20++;
    } else if (age <= 30) {
      totalWeight21to30 += weight;
      count21to30++;
    } else {
      totalWeight31plus += weight;
      count31plus++;
    }
  }

  double average1to10 = (count1to10 > 0) ? totalWeight1to10 / count1to10 : 0.0;
  double average11to20 = (count11to20 > 0) ? totalWeight11to20 / count11to20 : 0.0;
  double average21to30 = (count21to30 > 0) ? totalWeight21to30 / count21to30 : 0.0;
  double average31plus = (count31plus > 0) ? totalWeight31plus / count31plus : 0.0;

  print("Average weight (1-10 years): ${average1to10.toStringAsFixed(2)} kg");
  print("Average weight (11-20 years): ${average11to20.toStringAsFixed(2)} kg");
  print("Average weight (21-30 years): ${average21to30.toStringAsFixed(2)} kg");
  print("Average weight (31+ years): ${average31plus.toStringAsFixed(2)} kg");
}