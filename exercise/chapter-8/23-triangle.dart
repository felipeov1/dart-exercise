import '../reads.dart';

bool isTriangle(int a, int b, int c) {
  bool check1 = a <= (b + c);
  bool check2 = b <= (a + c);
  bool check3 = c <= (a + b);

  return check1 && check2 && check3;
}

String getTriangleType(int a, int b, int c) {
  if (a == b && b == c) {
    return "Equilateral";
  } else if (a == b || b == c || a == c) {
    return "Isosceles";
  } else {
    return "Scalene";
  }
}

void main() {
  int a = readInt("write side 1 (must be > 0): ");
  int b = readInt("write side 2 (must be > 0): ");
  int c = readInt("write side 3 (must be > 0): ");

  if (a <= 0 || b <= 0 || c <= 0) {
    print("All sides must be greater than zero.");
  } else {
    if (isTriangle(a, b, c)) {
      String type = getTriangleType(a, b, c);
      print("The sides form a triangle.");
      print("Type: $type");
    } else {
      print("The sides don't form a triangle.");
    }
  }
}
