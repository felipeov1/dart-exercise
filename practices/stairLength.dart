import 'dart:math';
import 'reads.dart';

void main() {
  double measurementAngle = readDouble(
    "write the measurement angle (degrees): ",
  );
  double stairHeight = readDouble("write the height of the stair (cm): ");

  double radians = measurementAngle * (pi / 180);

  double stairLength = stairHeight / sin(radians);

  print("The length of the stair is: ${stairLength.toStringAsFixed(2)} cm");
}
