import '../reads.dart';

double transformInSeconds(x, y, z) {
  double seconds = (x * 3600) + (y * 60) + z;
  return seconds;
}

void main() {
  double a = readDouble("Write the hours: ");
  double b = readDouble("Write the minutes: ");
  double c = readDouble("Write the seconds: ");

  print(transformInSeconds(a, b, c));
}
