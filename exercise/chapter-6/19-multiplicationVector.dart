void main() {
  List<int> vector1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> vector2 = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  List<int> vector3 = [];

  for (int i = 0; i < vector1.length; i++) {
    
    int result = vector1[i] * vector2[i];
    
    vector3.add(result);
  }

  print("Vector 1: $vector1");
  print("Vector 2: $vector2");
  print("vector with multiplication: $vector3");
}