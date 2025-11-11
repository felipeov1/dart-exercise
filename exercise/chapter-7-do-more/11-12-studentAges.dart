import '../reads.dart';

void main() {
  int numStudents = 8;
  int numSubjects = 5;

  List<int> studentAges = [];
  List<int> subjectCodes = [];
  List<List<int>> testCounts = [];


  for (int i = 0; i < numStudents; i++) {
    int age = readInt("write age for student ${i + 1}: ");
    studentAges.add(age);
  }

  for (int i = 0; i < numSubjects; i++) {
    int code = readInt("write code for subject ${i + 1}: ");
    subjectCodes.add(code);
  }

  for (int student = 0; student < numStudents; student++) {
    testCounts.add([]);
    print("For Student ${student + 1}");
    
    for (int subject = 0; subject < numSubjects; subject++) {
      int count = readInt(
          "write test count for Subject Code ${subjectCodes[subject]}: ");
      testCounts[student].add(count);
    }
  }

  print("Student Ages: $studentAges");
  print("Subject Codes: $subjectCodes");
  print("Test Counts Matrix: $testCounts");


  int codeToSearch = readInt("write the subject code to search for: ");
  
  int subjectIndex = subjectCodes.indexOf(codeToSearch);
  
  if (subjectIndex == -1) {
    print("Subject code $codeToSearch not found.");
  } else {
    int studentCount = 0;
    for (int student = 0; student < numStudents; student++) {
      int age = studentAges[student];
      int tests = testCounts[student][subjectIndex];
      
      if (age >= 18 && age <= 25 && tests > 2) {
        studentCount++;
      }
    }
    print("$studentCount students aged 18-25 took more than 2 tests in subject $codeToSearch.");
  }

  print("List of Students with < 3 Tests");
  bool foundAny = false;
  for (int subject = 0; subject < numSubjects; subject++) {
    for (int student = 0; student < numStudents; student++) {
      int tests = testCounts[student][subject];
      if (tests < 3) {
        print("Student $student took $tests tests in Subject Code ${subjectCodes[subject]}");
        foundAny = true;
      }
    }
  }
  if (!foundAny) {
    print("No student took fewer than 3 tests in any subject.");
  }
  
  print("Average Age of Students with 0 Tests");
  int totalAgeSum = 0;
  int studentsWithZeroTests = 0;
  
  for (int student = 0; student < numStudents; student++) {
    bool hasZeroTests = false;
    for (int subject = 0; subject < numSubjects; subject++) {
      if (testCounts[student][subject] == 0) {
        hasZeroTests = true;
        break; 
      }
    }
    
    if (hasZeroTests) {
      totalAgeSum += studentAges[student];
      studentsWithZeroTests++;
    }
  }
  
  if (studentsWithZeroTests == 0) {
    print("No student had 0 tests in any subject.");
  } else {
    double averageAge = totalAgeSum / studentsWithZeroTests;
    print("Found $studentsWithZeroTests students who took 0 tests in at least one subject.");
    print("Average age: ${averageAge.toStringAsFixed(2)}");
  }
}