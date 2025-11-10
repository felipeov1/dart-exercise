import '../reads.dart';
import 'dart:math';

void main() {
  double angleStair = readDouble("write the angle of the stair (degrees): ");
  double stairDistanceFromWall = readDouble(
    "write the distance from the wall to the base of the stair (cm): ",
  );

  double stairLength = stairDistanceFromWall / cos(angleStair * (pi / 180));

  print("The length of the stair is: ${stairLength.toStringAsFixed(2)} cm");
}
