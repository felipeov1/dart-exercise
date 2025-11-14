import '../reads.dart';

double calculatePositiveAverage() {
  int totalSum = 0;
  int count = 0;
  int number;

  do {
    number = readInt("write a positive number (0 to stop): ");

    if (number > 0) {
      totalSum += number;
      count++;
    }
    
  } while (number != 0);

  if (count == 0) {
    return 0.0;
  } else {
    return totalSum / count;
  }
}

void main() {
  double average = calculatePositiveAverage();
  
  print("Average of positive numbers: ${average.toStringAsFixed(2)}");
}