import '../reads.dart';

void main() {
  int rowSize = 15;
  int columnSize = 5;

  List<List<double>> matrix = [];
  List<String> names = [];

  for (int i = 0; i < rowSize; i++) {
    String name = readString("Write the name of the student: ");
    names.add(name);
  }

  for (int row = 0; row < rowSize; row++) {
    matrix.add([]);
    for (int column = 0; column < columnSize; column++) {
      double grade = readDouble(
          "Write the grade of the test ${column + 1} of student ${names[row]}: ");
      matrix[row].add(grade);
    }
    print("Grades for ${names[row]}: ${matrix[row]}");
  }

  print("\n-- Grade System --\n");

  double totalGrades = 0.0; 

  for (int i = 0; i < rowSize; i++) {
    print("Student: ${names[i]}");
    double sum = 0.0; 

    for (int j = 0; j < columnSize; j++) {
      double grade = matrix[i][j];
      print("Test ${j + 1}: $grade");
      sum += grade; 
    }

    double average = sum / columnSize;
    totalGrades += sum; 

    print("Average: ${average.toStringAsFixed(2)}\n");
  }

  double classAverage = totalGrades / (rowSize * columnSize);
  print("Class average: ${classAverage.toStringAsFixed(2)}");
}
