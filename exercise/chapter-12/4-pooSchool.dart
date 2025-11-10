import '../reads.dart';

class Student {
  int code;
  String name;

  Student({required this.code, required this.name});
}

class Discipline {
  int code;
  String name;
  int generalHours; 

  Discipline({
    required this.code,
    required this.name,
    required this.generalHours, 
  });

  int get practicalHours => 0; 

  double calculateAverage(double n1, double n2, double n3, double n4) {
    return (n1 + n2 + n3 + n4) / 4;
  }
}

class PracticalDiscipline extends Discipline {
  int _practicalHours; 

  PracticalDiscipline({
    required int code,
    required String name,
    required int generalHours, 
    required int practicalHours, 
  })  : _practicalHours = practicalHours,
        super(code: code, name: name, generalHours: generalHours); 

  int get practicalHours => _practicalHours; 

  double calculateAverage(double n1, double n2, double n3, double n4) {
    double totalPoints = (n1 * 1) + (n2 * 2) + (n3 * 1) + (n4 * 2);
    double totalWeights = 6;
    return totalPoints / totalWeights;
  }
}

class Enrollment {
  int year;
  String classSeries;
  Student student;
  Discipline discipline;

  double gradeTerm1 = 0.0;
  double gradeTerm2 = 0.0;
  double gradeTerm3 = 0.0;
  double gradeTerm4 = 0.0;

  Enrollment({
    required this.year,
    required this.classSeries,
    required this.student,
    required this.discipline,
  });
}

List<Student> allStudents = [];
List<Discipline> allDisciplines = [];
List<Enrollment> allEnrollments = [];

Student? findStudentById(int id) {
  for (var student in allStudents) {
    if (student.code == id) {
      return student;
    }
  }
  return null;
}

Discipline? findDisciplineById(int id) {
  for (var discipline in allDisciplines) {
    if (discipline.code == id) {
      return discipline;
    }
  }
  return null;
}

Enrollment? findEnrollment(int studentId, int disciplineId, int year) {
  for (var enrollment in allEnrollments) {
    if (enrollment.student.code == studentId &&
        enrollment.discipline.code == disciplineId &&
        enrollment.year == year) {
      return enrollment;
    }
  }
  return null;
}

void registerDiscipline() {
  int code = readInt("write discipline code:");
  String name = readString("write discipline name:");
  int chGeneral = readInt("write general hours (CH):"); 
  String isPractical = readString("Is this a practical discipline? (y/n):");

  if (isPractical.toLowerCase() == 'y') {
    int chPratic = readInt("write practical hours (CH Practical):"); 
    PracticalDiscipline d = PracticalDiscipline(
      code: code,
      name: name,
      generalHours: chGeneral, 
      practicalHours: chPratic, 
    );
    allDisciplines.add(d);
  } else {
    Discipline d =
        Discipline(code: code, name: name, generalHours: chGeneral); 
    allDisciplines.add(d);
  }
  print("Discipline '${name}' registered.");
}

void registerStudent() {
  int code = readInt("write student code:");
  String name = readString("write student name:");

  Student a = Student(code: code, name: name);
  allStudents.add(a);
  print("Student '${name}' registered.");
}

void enrollStudent() {
  int year = readInt("write enrollment year:");
  String series = readString("write class series:");
  int studentId = readInt("write student code:");
  int disciplineId = readInt("write discipline code:");

  Student? student = findStudentById(studentId);
  if (student == null) {
    print("Student code $studentId not found.");
    return;
  }

  Discipline? discipline = findDisciplineById(disciplineId);
  if (discipline == null) {
    print("Discipline code $disciplineId not found.");
    return;
  }

  Enrollment? existing = findEnrollment(studentId, disciplineId, year);
  if (existing != null) {
    print("This student is already enrolled in this discipline for this year.");
    return;
  }

  Enrollment m = Enrollment(
    year: year,
    classSeries: series,
    student: student,
    discipline: discipline,
  );
  allEnrollments.add(m);
  print("${student.name} enrolled in ${discipline.name}.");
}

void writeGrades() {
  int studentId = readInt("write student code:");
  int disciplineId = readInt("write discipline code:");
  int year = readInt("write enrollment year:");

  Enrollment? enrollment = findEnrollment(studentId, disciplineId, year);
  if (enrollment == null) {
    print("Enrollment not found. (Invalid Enrollment)");
    return;
  }

  print(
    "Found enrollment for ${enrollment.student.name} in ${enrollment.discipline.name}.",
  );

  int term = readInt("write the grade period:");
  double grade = readDouble("write the grade:");

  switch (term) {
    case 1:
      enrollment.gradeTerm1 = grade;
      break;
    case 2:
      enrollment.gradeTerm2 = grade;
      break;
    case 3:
      enrollment.gradeTerm3 = grade;
      break;
    case 4:
      enrollment.gradeTerm4 = grade;
      break;
    default:
      print("wrong grade period.");
      return;
  }
  print("Grade writeed.");
}

void showReportCard() {
  int studentId = readInt("Write student code:");
  int year = readInt("Write the year for the report card:");

  Student? student = findStudentById(studentId);
  if (student == null) {
    print("Student not found.");
    return;
  }

  List<Enrollment> studentEnrollments = [];
  for (var enrollment in allEnrollments) {
    if (enrollment.student.code == studentId && enrollment.year == year) {
      studentEnrollments.add(enrollment);
    }
  }

  if (studentEnrollments.isEmpty) {
    print("No enrollments found for ${student.name} in $year.");
    return;
  }

  print("Code: ${student.code} Name: ${student.name}");
  print("Year: $year");
  print(
    "Discipline".padRight(15) +
        "CH".padRight(5) +
        "CH Prac".padRight(12) + 
        "1st".padRight(10) +
        "2nd".padRight(10) +
        "3rd".padRight(10) +
        "4th".padRight(10) +
        "Average",
  );
  print(
    "--------------------------------------------------------------------------------------",
  );

  for (var enrollment in studentEnrollments) {
    Discipline d = enrollment.discipline;

    double average = d.calculateAverage(
      enrollment.gradeTerm1,
      enrollment.gradeTerm2,
      enrollment.gradeTerm3,
      enrollment.gradeTerm4,
    );

    String dName = d.name.padRight(15);
    String dCH = d.generalHours.toString().padRight(5); 
    String dPracCH =
        d.practicalHours.toString().padRight(12); 
    String n1 = enrollment.gradeTerm1.toStringAsFixed(1).padRight(10);
    String n2 = enrollment.gradeTerm2.toStringAsFixed(1).padRight(10);
    String n3 = enrollment.gradeTerm3.toStringAsFixed(1).padRight(10);
    String n4 = enrollment.gradeTerm4.toStringAsFixed(1).padRight(10);
    String mFinal = average.toStringAsFixed(2);

    print("$dName$dCH$dPracCH$n1$n2$n3$n4$mFinal"); 
  }
  print("================================================");
}

void main() {
  while (true) {
    print("a) Register Discipline");
    print("b) Register Student");
    print("c) Enroll Student in Discipline");
    print("d) write Grades");
    print("e) Show Student Report Card");
    print("q) Quit");
    String choice = readString("Choose an option:").toLowerCase();

    switch (choice) {
      case 'a':
        registerDiscipline();
        break;
      case 'b':
        registerStudent();
        break;
      case 'c':
        enrollStudent();
        break;
      case 'd':
        writeGrades();
        break;
      case 'e':
        showReportCard();
        break;
      case 'q':
        print("Exitd"); 
        return;
      default:
        print("Invalid option.");
    }
  }
}