import '../reads.dart';

int calculateMDC(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

void main() {
  int num1 = readInt("write the first number: ");
  int num2 = readInt("write the second number: ");

  int result = calculateMDC(num1, num2);

  print("MDC is: $result");
}