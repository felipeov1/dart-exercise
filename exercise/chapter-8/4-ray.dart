import '../reads.dart';
import 'dart:math';

double calculateCircleVolume(ray) {
  double volume;

  volume = 4.0 / 3.0 * pi * pow(ray, 3);

  return volume;
}


void main() {
  double rayCircle = readDouble("Write the circle ray: ");
  print(calculateCircleVolume(rayCircle));
}

