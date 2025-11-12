import '../reads.dart';

int getNextDivisor(int a, int b) {
  if (b == 0) {
    return -1; 
  }

  if (a % b == 0) {
    return 0;
  }

  for (int i = b + 1; i <= a; i++) {
    if (a % i == 0) {
      return i;
    }
  }
  
  return -1; 
}

void main() {
  int num1 = readInt("write the first number (a): ");
  int num2 = readInt("write the second number (b): ");

  int result = getNextDivisor(num1, num2);

  if (result == 0) {
    print("Result: 0 ($num1 is divisible by $num2)");
  } else if (result == -1) {
    print("Result: -1 (Error: b is 0 or b > a)");
  } else {
    print("Next divisor: $result");
  }
}