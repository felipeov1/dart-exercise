import '../reads.dart';

void main() {
  int value;
  int largestValue = 0;
  int smallestValue = 0;
  bool isFirstValue = true;

  while (true) {
    value = readInt("Write a positive integer (0 to exit): ");

    if (value == 0) {
      break;
    }

    if (value < 0) {
      print("Negative values are not allowed.");
      continue;
    }

    if (isFirstValue) {
      largestValue = value;
      smallestValue = value;
      isFirstValue = false;
    } else {
      if (value > largestValue) {
        largestValue = value;
      }
      if (value < smallestValue) {
        smallestValue = value;
      }
    }
  }

  if (isFirstValue) {
    print("No positive values were entered.");
  } else {
    print("Largest value: $largestValue");
    print("Smallest value: $smallestValue");
  }
}