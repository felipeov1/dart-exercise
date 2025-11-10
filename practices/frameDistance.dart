import 'reads.dart';
import 'dart:math';

void main() {
  double stairLength = readDouble("write the length of the stair (cm): ");

  double frameHeight = readDouble("write the height of the frame (cm): ");

  if (frameHeight >= stairLength) {
    print("The frame height must be less than the stair length.");
    double frameHeight = readDouble("write the height of the frame (cm): ");
    return;
  }

  double distanceFromWall = sqrt(
    stairLength * stairLength - frameHeight * frameHeight,
  );

  print(distanceFromWall);
}
