void main() {
  List<int> vector1 = [5, 12, 3, 18, 7, 22, 9, 1, 15, 30];
  List<int> vector2 = [10, 2, 25, 8, 14, 20, 6, 11, 28, 4];

  List<int> vector3 = [];
  vector3.addAll(vector1);
  vector3.addAll(vector2);

  int n = vector3.length;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n - 1 - i; j++) {

      if (vector3[j] < vector3[j + 1]) {
        int temp = vector3[j];
        vector3[j] = vector3[j + 1];
        vector3[j + 1] = temp;
      }
    }
  }

  print("descending vector: $vector3");
}