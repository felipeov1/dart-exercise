import 'dart:io';
import '../reads.dart';
class Course {
  String description;
  int studentCount;
  double monthlyFee;

  Course(this.description, this.studentCount, this.monthlyFee);
}

List<Course> courses = [];
const int maxCourses = 5; 

void registerCourses() {
  for (int i = 0; i < maxCourses; i++) {
    print("Course ${i + 1}");
    String desc = readString("write course description: ");
    int students = readInt("write number of students enrolled: ");
    double fee = readDouble("write monthly fee value: ");

    courses.add(Course(desc, students, fee));
  }
  print("Courses registered.");
}

void showStatistics() {
  if (courses.isEmpty) {
    print("No courses.");
    return;
  }

  int totalStudents = 0;
  for (Course c in courses) {
    totalStudents += c.studentCount;
  }
  double averageStudents = totalStudents / courses.length;

  double highestRevenue = 0;
  String highestRevenueCourse = "";

  for (Course c in courses) {
    double currentRevenue = c.studentCount * c.monthlyFee;
    
    if (currentRevenue > highestRevenue) {
      highestRevenue = currentRevenue;
      highestRevenueCourse = c.description;
    }
  }

  print("Average students per course: ${averageStudents.toStringAsFixed(2)}");
  print("Course with highest revenue: $highestRevenueCourse");
}

void main() {
  registerCourses();
  showStatistics();
}
