import '../chapter-6/2-vetorMultiple.dart';

void findEven(x) {
  int evenQnty = 0;
  for (int i = 0; i < x.length; i++) {
    if (x[i] % 2 == 0) {
      evenQnty++;
    }
  }
  print("$x - found even numbers: $evenQnty");
}

void main() {
  List<int> vector = [];

  vector = randomNumbers(15);

  findEven(vector);
}
