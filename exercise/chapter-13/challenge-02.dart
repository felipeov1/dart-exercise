import '../reads.dart';
import 'dart:math';

void main() {
  double largestDiameter = readDouble("write the largest diameter: ");

  double largestRadius = largestDiameter / 2.0;
  double radiusUnit = largestRadius / 6.0;
  double totalArea = 0.0;

  for (int i = 1; i <= 6; i++) {
    double currentRadius = radiusUnit * i;
    double circleArea = pi * pow(currentRadius, 2);
    totalArea += circleArea;
  }

  int totalTargets = 5000;
  double total = totalArea * totalTargets;

  print("Total needed: ${total.toStringAsFixed(2)}");
}