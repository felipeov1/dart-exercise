import '../reads.dart';

void main() {
  int sizeVector1 = 10;
  int sizeVector2 = 5;

  List<int> vector1 = [];
  List<int> vector2 = [];

  List<int> resultVector1 = [];
  List<int> resultVector2 = [];

  for (int i = 0; i < sizeVector1; i++) {
    int value = readInt("Write value ${i + 1} for the first vector: ");
    vector1.add(value);
  }

  for (int i = 0; i < sizeVector2; i++) {
    int value = readInt("Write value ${i + 1} for the second vector: ");
    vector2.add(value);
  }

  int sumVector2 = 0;
  for (int i = 0; i < sizeVector2; i++) {
    sumVector2 = sumVector2 + vector2[i];
  }

  for (int i = 0; i < sizeVector1; i++) {
    int numFromVector1 = vector1[i];

    if (numFromVector1 % 2 == 0) {
      int result = numFromVector1 + sumVector2;
      resultVector1.add(result);
    }
  }

  for (int i = 0; i < sizeVector1; i++) {
    int numFromVector1 = vector1[i];

    if (numFromVector1 % 2 != 0) {
      int divisorCount = 0;

      for (int j = 0; j < sizeVector2; j++) {
        int numFromVector2 = vector2[j];
        
        if (numFromVector2 != 0 && numFromVector1 % numFromVector2 == 0) {
          divisorCount++;
        }
      }
      resultVector2.add(divisorCount);
    }
  }

  print("First resulting vector (even numbers calculation):");
  print(resultVector1);
  
  print("Second resulting vector (odd numbers divisors calculation):");
  print(resultVector2);
}