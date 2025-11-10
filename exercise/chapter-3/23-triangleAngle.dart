import '../reads.dart';

void main() {
  double firstAngle = readDouble("write the first angle: ");
  double secondAngle = readDouble("write the second angle: ");

  double thirdAngle = 180 - (firstAngle + secondAngle);

  print("The third angle is: ${thirdAngle}");
}
