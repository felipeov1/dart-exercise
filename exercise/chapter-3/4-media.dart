import '../reads.dart';

void main() {
  double firstGrade = readDouble("write the first grade: ");
  double secondGrade = readDouble("write the second grade: ");

  double average = (firstGrade * 2) + (secondGrade * 3) / 2;

  print("The weighted average is: $average");
}
