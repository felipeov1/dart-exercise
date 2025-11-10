import '../reads.dart';

void main() {
  int polygonSides = readInt("write the number of polygon sides: ");

  int dgPolygon = (polygonSides * (polygonSides - 3) / 2).toInt();

  print("The number of diagonals in polygon is: ${dgPolygon}");
}
