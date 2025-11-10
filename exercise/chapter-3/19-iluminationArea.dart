import '../reads.dart';

void main() {
  double sideA = readDouble("write the length of side A (m): ");
  double sideB = readDouble("write the length of side B (m): ");

  double area = sideA * sideB;

  double iluminationArea = area / 18;

  print("The ilumination area is: ${iluminationArea.toStringAsFixed(2)} m²");
}
