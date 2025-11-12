import 'dart:math';

void calculateTheSum(vt) {
  double result = 0;
  for (int i = 0; i < vt.length; i++) {
    result += vt[i];
  }
  print(result);
}

void main() {
  var random = Random();
  var vector = List.generate(20, (_) => random.nextInt(100)); 
  calculateTheSum(vector);
}