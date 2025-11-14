import '../reads.dart';

double calculateSumS(int N) {
  double sum = 0.0;

  for (int n = 1; n <= N; n++) {
    double numerator = (n * n) + 1;
    double denominator = n + 3;
    
    sum += (numerator / denominator);
  }
  
  return sum;
}

void main() {
  int N = readInt("write the number: ");

  if (N <= 0) {
    print("N must be a positive number.");
  } else {
    double result = calculateSumS(N);
    print("The sum S is: ${result.toStringAsFixed(4)}");
  }
}