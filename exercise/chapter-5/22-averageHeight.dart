import '../reads.dart';

void main() {
  int age;
  double height;
  double totalHeight = 0;
  int personCount = 0;

  while (true) {
    try {
      age = readInt("Write your age (0 or less to exit): ");
    } catch (e) {
      age = 0;
    }

    if (age <= 0) {
      break;
    }

    try {
      height = readDouble("Write your height: ");
    } catch (e) {
      height = 0;
    }

    if (age > 50 && height > 0) {
      totalHeight += height;
      personCount++;
    }
  }

  if (personCount == 0) {
    print("No people over 50 were registered.");
  } else {
    double averageHeight = totalHeight / personCount;
    print("Average height of people over 50: ${averageHeight.toStringAsFixed(2)}");
  }
}