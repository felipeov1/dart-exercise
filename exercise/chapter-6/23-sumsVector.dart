void main() {
  List<int> vectorA = [10, 20, 30, 40, 50];
  List<int> vectorB = [1, 2, 3, 4, 5];

  int total = 0;

  for (int i = 0; i < 5; i++) {
    int elementA = vectorA[i];

    int indexB = (5 - 1) - i;
    int elementB = vectorB[indexB];

    int subtraction = elementA - elementB;

    total += subtraction;
  }

  print("result: $total");
}
