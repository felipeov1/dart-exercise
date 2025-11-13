import '../reads.dart';

class Patient {
  final int cod_pac;
  String nome;
  String endereco;
  String fone;

  Patient(this.cod_pac, this.nome, this.endereco, this.fone);
}

class Doctor {
  final cod_doc;
  String nome;
  String fone;
  String endereco;

  Doctor(this.cod_doc, this.nome, this.fone, this.endereco);
}

class Consultation {
  final num_consulta;
  String dia;
  String semana;
  String hora;
  final cod_med;
  final cod_pac;

  Consultation(
    this.num_consulta,
    this.dia,
    this.semana,
    this.hora,
    this.cod_med,
    this.cod_pac,
  );
}

List<Patient> patients = [];
List<Doctor> doctors = [];
List<Consultation> consultations = [];

int findPatient(int code) {
  for (int i = 0; i < patients.length; i++) {
    if (patients[i].cod_pac == code) {
      return i;
    }
  }
  return -1;
}

int findDoctor(int code) {
  for (int i = 0; i < doctors.length; i++) {
    if (doctors[i].cod_doc == code) {
      return i;
    }
  }
  return -1;
}

String getPatientName(int code) {
  int index = findPatient(code);
  return (index == -1) ? "Unknown" : patients[index].nome;
}

String getDoctorName(int code) {
  int index = findDoctor(code);
  return (index == -1) ? "Unknown" : doctors[index].nome;
}

int countDoctorConsultsOnDay(int codMed, String dia) {
  int count = 0;
  for (Consultation c in consultations) {
    if (c.cod_med == codMed && c.dia == dia) {
      count++;
    }
  }
  return count;
}

void addPatients() {
  for (int i = 0; i < 5; i++) {
    int code = readInt("write patient code ${i + 1}: ");
    if (findPatient(code) != -1) {
      print("Patient code exists.");
      i--;
      continue;
    }
    String name = readString("write patient name: ");
    String address = readString("write patient address: ");
    String phone = readString("write patient phone: ");
    patients.add(Patient(code, name, address, phone));
  }
  print("Patients added.");
}

void addDoctors() {
  for (int i = 0; i < 3; i++) {
    int code = readInt("write doctor code ${i + 1}: ");
    if (findDoctor(code) != -1) {
      print("Doctor code exists.");
      i--;
      continue;
    }
    String name = readString("write doctor name: ");
    String address = readString("write doctor address: ");
    String phone = readString("write doctor phone: ");
    doctors.add(Doctor(code, name, phone, address));
  }
  print("Doctors added.");
}

void addConsultation() {
  int docCode = readInt("write doctor code: ");
  if (findDoctor(docCode) == -1) {
    print("Doctor not found.");
    return;
  }
  
  int patCode = readInt("write patient code: ");
  if (findPatient(patCode) == -1) {
    print("Patient not found.");
    return;
  }

  String dia = readString("write date (DD/MM/YYYY): ");

  int consults = countDoctorConsultsOnDay(docCode, dia);
  if (consults >= 2) {
    print("Doctor already has 2 consultations on this day.");
    return;
  }
  
  String semana = readString("write day of week: ");
  String hora = readString("write time (HH:MM): ");
  int numConsulta = readInt("write consultation number: ");
  
  consultations.add(Consultation(numConsulta, dia, semana, hora, docCode, patCode));
  print("Consultation added.");
}

void searchConsultations() {
  int docCode = readInt("write doctor code: ");
  String semana = readString("write day of week: ");
  bool found = false;

  print("Consultations Found:");
  for (Consultation c in consultations) {
    if (c.cod_med == docCode && c.semana.toLowerCase() == semana.toLowerCase()) {
      String patName = getPatientName(c.cod_pac);
      print("Appt: ${c.num_consulta}, Patient: $patName, Time: ${c.hora}");
      found = true;
    }
  }
  if (!found) {
    print("No consultations found.");
  }
}

void showReportByDay() {
  String dia = readString("write date (DD/MM/YYYY): ");
  bool found = false;

  print("Report for day: $dia");
  for (Consultation c in consultations) {
    if (c.dia == dia) {
      String docName = getDoctorName(c.cod_med);
      String patName = getPatientName(c.cod_pac);
      print("Appt: ${c.num_consulta}, Time: ${c.hora}");
      print("  Doctor: $docName");
      print("  Patient: $patName");
      found = true;
    }
  }
  if (!found) {
    print("No consultations found.");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Patients (5)");
    print("2. Add Doctors (3)");
    print("3. Add Consultation");
    print("4. Search Consultations");
    print("5. Show Report by Day");
    print("6. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1: addPatients(); break;
      case 2: addDoctors(); break;
      case 3: addConsultation(); break;
      case 4: searchConsultations(); break;
      case 5: showReportByDay(); break;
      case 6: print("Exited"); break;
      default: print("Invalid option.");
    }
  } while (option != 6);
}