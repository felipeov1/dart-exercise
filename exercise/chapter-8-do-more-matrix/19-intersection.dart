import '../chapter-6/2-vetorMultiple.dart';

List<int> findIntersection(vtX, vtY) {
  List<int> intersection = [];

  for (int i = 0; i < 10; i++) {
    if (vtX[i] == vtY[i]) {
      intersection.add(vtX[i]);
    }
  }
  print("vtX: $vtX");
  print("vtY: $vtY");

  return intersection;
}

void main() {
  List<int> vectorX, vectorY;

  vectorX = randomNumbers(10);
  vectorY = randomNumbers(10);

  print(findIntersection(vectorX, vectorY));
}
