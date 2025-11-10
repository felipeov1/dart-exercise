import '../reads.dart';

void main() {
  double number1 = readDouble("Write the number 1: ");
  double number2 = readDouble("Write the number 2: ");

  double smallest = number1 < number2 ? number1 : number2;

  print(smallest);
}
