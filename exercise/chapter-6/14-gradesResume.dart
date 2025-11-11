import '../reads.dart';

void main() {
  const int totalStudents = 6;
  const double minApproved = 7.0;
  const double minExam = 5.0;

  List<String> studentNames = [];
  List<double> grade1s = [];
  List<double> grade2s = [];
  List<double> averages = [];
  List<String> situations = [];

  double classTotalSum = 0.0;
  int approvedCount = 0;
  int examCount = 0;
  int reprovedCount = 0;

  for (int i = 0; i < totalStudents; i++) {
    String name = readString("Write the name for student ${i + 1}: ");
    double grade1 = readDouble("Write grade 1 for $name: ");
    double grade2 = readDouble("Write grade 2 for $name: ");
    
    double average = (grade1 + grade2) / 2.0;
    String situation;

    if (average >= minApproved) {
      situation = "Approved";
      approvedCount++;
    } else if (average >= minExam) {
      situation = "Exam";
      examCount++;
    } else {
      situation = "reproved";
      reprovedCount++;
    }

    studentNames.add(name);
    grade1s.add(grade1);
    grade2s.add(grade2);
    averages.add(average);
    situations.add(situation);
    
    classTotalSum += average;
  }

  print("Grades Resume:");
  print("STUDENT".padRight(15) + "GRADE 1".padRight(10) + "GRADE 2".padRight(10) + "AVERAGE".padRight(10) + "SITUATION");

  for (int i = 0; i < totalStudents; i++) {
    String name = studentNames[i].padRight(15);
    String g1 = grade1s[i].toStringAsFixed(1).padRight(10);
    String g2 = grade2s[i].toStringAsFixed(1).padRight(10);
    String avg = averages[i].toStringAsFixed(1).padRight(10);
    String sit = situations[i];
    
    print("$name$g1$g2$avg$sit");
  }

  double classAverage = classTotalSum / totalStudents;
  double approvedPercentage = (approvedCount / totalStudents) * 100.0;
  double examPercentage = (examCount / totalStudents) * 100.0;
  double reprovedPercentage = (reprovedCount / totalStudents) * 100.0;

  print("Class average = ${classAverage.toStringAsFixed(2)}");
  print("Percentage of approved students = ${approvedPercentage.toStringAsFixed(2)}%");
  print("Percentage of exam students = ${examPercentage.toStringAsFixed(2)}%");
  print("Percentage of reproved students = ${reprovedPercentage.toStringAsFixed(2)}%");
}