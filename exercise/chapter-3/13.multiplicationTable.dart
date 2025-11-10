import '../reads.dart';

void calculateMultiplicationTable(int number) {
  for (int i = 1; i <= 10; i++) {
    int result = number * i;
    print("$number x $i = $result");
  }
  return;
}

void main() {
  int multiplicationTableNumber = readInt(
    "write a number to generate its multiplication table: ",
  );

  calculateMultiplicationTable(multiplicationTableNumber);
}
