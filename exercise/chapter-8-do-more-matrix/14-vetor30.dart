import '../reads.dart';

(List<int>, List<int>) separeteNumbers(vt) {
  List<int> a = [];
  List<int> b = [];

  for (int i = 0; i < vt.length; i++) {
    if (vt[i] > 0) {
      a.add(vt[i]);
    } else {
      b.add(vt[i]);
    }
  }

  return (a, b);
}

void main() {
  List<int> numbers = [];

  int qntd = 3;

  for (int i = 0; i < qntd; i++) {
    int number = readInt("Write a number: ");
    numbers.add(number);
  }

  print(separeteNumbers(numbers));
}
