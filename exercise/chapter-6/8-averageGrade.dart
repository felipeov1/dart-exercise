import '../reads.dart';

void main() {
  List<String> studentNames = [];
  List<double> finalAverages = [];
  
  double highestAverage = 0.0;
  String topStudentName = "";
  const int totalStudents = 7;

  for (int i = 0; i < totalStudents; i++) {
    String name = readString("Write the name for student ${i + 1}: ");
    double average = readDouble("Write the final average for $name: ");
    
    studentNames.add(name);
    finalAverages.add(average);
    
    if (average > highestAverage) {
      highestAverage = average;
      topStudentName = name;
    }
  }
  
  print("Student with the highest average: $topStudentName");

  for (int i = 0; i < totalStudents; i++) {
    if (finalAverages[i] < 7.0) {
      String name = studentNames[i];
      double neededScore = 10.0 - finalAverages[i];

      print("$name needs to score ${neededScore.toStringAsFixed(2)} on the final exam.");
    }
  }
}