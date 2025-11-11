import '../reads.dart';

void main() {
  const int totalStudents = 8;
  List<String> studentNames = [];
  List<double> studentGrades = [];
  double totalGradeSum = 0.0;


  for (int i = 0; i < totalStudents; i++) {
    String name = readString("Write the name of the ${i + 1}° student: ");
    double grade = readDouble("Write the grade for $name: ");
    
    studentNames.add(name);
    studentGrades.add(grade);
    totalGradeSum += grade;
  }

  print("Grades Report");
  for (int i = 0; i < totalStudents; i++) {
    print("${studentNames[i]} ${studentGrades[i].toStringAsFixed(1)}");
  }

  double classAverage = totalGradeSum / totalStudents;
  print("Class average = ${classAverage.toStringAsFixed(2)}");
}