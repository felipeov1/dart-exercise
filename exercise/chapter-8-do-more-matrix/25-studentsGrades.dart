import '../reads.dart';

List<double> calculateAverages(List<List<double>> allGrades) {
  List<double> averages = [];

  for (List<double> studentGrades in allGrades) {
    double sum = 0;
    for (double grade in studentGrades) {
      sum += grade;
    }
    averages.add(sum / studentGrades.length);
  }
  return averages;
}

List<int> findFailingStudents(List<int> studentNumbers, List<double> averages) {
  List<int> failingStudentNumbers = [];

  for (int i = 0; i < studentNumbers.length; i++) {
    if (averages[i] < 6.0) {
      failingStudentNumbers.add(studentNumbers[i]);
    }
  }
  return failingStudentNumbers;
}

void main() {
  List<int> studentNumbers = [];
  List<List<double>> grades = [];
  int numStudents = 10;
  int numGrades = 4;

  for (int i = 0; i < numStudents; i++) {
    int number = readInt("Write the student number ${i + 1}: ");
    studentNumbers.add(number);

    List<double> currentStudentGrades = [];
    for (int j = 0; j < numGrades; j++) {
      double grade = readDouble("write grade ${j + 1}: ");
      currentStudentGrades.add(grade);
    }
    grades.add(currentStudentGrades);
  }

  List<double> allAverages = calculateAverages(grades);
  List<int> failingStudents = findFailingStudents(studentNumbers, allAverages);

  for (int i = 0; i < numStudents; i++) {
    print(
      "Student ${studentNumbers[i]}: Average ${allAverages[i].toStringAsFixed(2)}",
    );
  }

  print("Students that need exam (Average < 6)");
  print(failingStudents);
}
