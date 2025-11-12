import '../reads.dart';

String check(int number) {
  if (number > 0) {
    return "Positive";
  } else if (number < 0) {
    return "Negative";
  } else {
    return "Zero";
  }
}

void main() {
  int number = readInt("write an integer: ");
  String result = check(number);
  
  print("The number is: $result");
}