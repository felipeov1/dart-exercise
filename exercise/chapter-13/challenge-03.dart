import '../reads.dart';
import 'dart:math';

void main() {
  double heightInMeters = readDouble("write the height (m): ");
  double angleInDegrees = readDouble("write the angle in degrees: ");

  double angleInRadians = angleInDegrees * (pi / 180);
  double length = heightInMeters / sin(angleInRadians);

  double rungSpacing = 0.30;
  double requiredRungs = length / rungSpacing;
  int totalRungs = requiredRungs.ceil();

  print("Total rungs needed: $totalRungs");
}