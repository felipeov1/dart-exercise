import '../reads.dart';

void main() {
  int age = readInt("Write your age: ");

  String majorOrNot = age == 18 || age > 18 ? "Major" : "Minor";

  print(majorOrNot);
}
