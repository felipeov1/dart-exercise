import '../reads.dart';
import 'dart:math';

void main() {
  double rayLength = readDouble("write the length of the ray (cm): ");

  double lengthOfCircle = 2 * pi * rayLength;
  double areaOfCircle = pi * (rayLength * rayLength);
  double volumeOfSphere = (3 / 4) * pi * (rayLength * rayLength * rayLength);

  print(
    "The length of the circle is: ${lengthOfCircle.toStringAsFixed(2)} cm. The area of the circle is: ${areaOfCircle.toStringAsFixed(2)} cm². The volume of the sphere is: ${volumeOfSphere.toStringAsFixed(2)} cm³.",
  );
}
