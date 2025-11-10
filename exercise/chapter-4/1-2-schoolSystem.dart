import '../reads.dart';

void main() {
  double qntStudents = readDouble(
    "Write the numbers of students in the class: ",
  );

  List<double> grades = [];
  double grade;
  double tempSum = 0;

  for (int i = 0; i <= qntStudents - 1; i++) {
    for (int j = 1; j <= 2; j++) {
      grade = readDouble("grade ${j} - Student ${i}: ");
      tempSum = tempSum + grade;
    }
    tempSum = tempSum / 2;
    grades.insert(i, tempSum);
  }

  for (int i = 0; i < grades.length; i++) {
    if (grades[i] <= 0 && grades[i] <= 30) {
      print("Average ${grades[i]} - Reproved");
    } else if (grades[i] >= 30 && grades[i] <= 70) {
      print("Average ${grades[i]} - EXAM");
    } else {
      print("Average ${grades[i]} - Approved");
    }
  }
}
