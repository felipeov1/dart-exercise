import '../reads.dart';

class Doctor {
  final int Cod_medico;
  String Nome;
  String Endereco;
  double Salario;

  Doctor(this.Cod_medico, this.Nome, this.Endereco, this.Salario);
}

class Patient {
  final int Cod_pac;
  String Nome_pac;
  String Endereco;
  int Idade;

  Patient(this.Cod_pac, this.Nome_pac, this.Endereco, this.Idade);
}

class Appointment {
  final int Num_prontuario;
  final DateTime Data_consulta;
  String Diagnostico;
  final int Cod_medico;
  final int Cod_paciente;

  Appointment(this.Num_prontuario, this.Data_consulta, this.Diagnostico,
      this.Cod_medico, this.Cod_paciente);
}

List<Doctor> doctors = [];
List<Patient> patients = [];
List<Appointment> appointments = [];

int findDoctor(int code) {
  for (int i = 0; i < doctors.length; i++) {
    if (doctors[i].Cod_medico == code) {
      return i;
    }
  }
  return -1;
}

int findPatient(int code) {
  for (int i = 0; i < patients.length; i++) {
    if (patients[i].Cod_pac == code) {
      return i;
    }
  }
  return -1;
}

bool doctorHasAppointments(int codMedico) {
  for (Appointment app in appointments) {
    if (app.Cod_medico == codMedico) {
      return true;
    }
  }
  return false;
}

String getDoctorName(int code) {
  int index = findDoctor(code);
  return (index == -1) ? "Unknown Doctor" : doctors[index].Nome;
}

String getPatientName(int code) {
  int index = findPatient(code);
  return (index == -1) ? "Unknown Patient" : patients[index].Nome_pac;
}

void addDoctor() {
  int code = readInt("write doctor code: ");
  if (findDoctor(code) != -1) {
    print("Doctor code exists.");
    return;
  }
  String name = readString("write doctor name: ");
  String address = readString("write doctor address: ");
  double salary = readDouble("write doctor salary: ");

  doctors.add(Doctor(code, name, address, salary));
  print("Doctor added.");
}

void updateDoctor() {
  int code = readInt("write doctor code to update: ");
  int index = findDoctor(code);

  if (index == -1) {
    print("Doctor not found.");
    return;
  }
  
  print("Updating doctor: ${doctors[index].Nome}");
  doctors[index].Nome = readString("write new name: ");
  doctors[index].Endereco = readString("write new address: ");
  doctors[index].Salario = readDouble("write new salary: ");
  print("Doctor updated.");
}

void addPatient() {
  int code = readInt("write patient code: ");
  if (findPatient(code) != -1) {
    print("Patient code already.");
    return;
  }
  String name = readString("write patient name: ");
  String address = readString("write patient address: ");
  int age = readInt("write patient age: ");

  patients.add(Patient(code, name, address, age));
  print("Patient added.");
}

void updatePatient() {
  int code = readInt("write patient code to update: ");
  int index = findPatient(code);

  if (index == -1) {
    print("Patient not found.");
    return;
  }
  
  patients[index].Nome_pac = readString("write new name: ");
  patients[index].Endereco = readString("write new address: ");
  patients[index].Idade = readInt("write new age: ");
  print("Patient updated successfully.");
}

void addAppointment() {
  int docCode = readInt("write doctor code: ");
  if (findDoctor(docCode) == -1) {
    print("Doctor not foun");
    return;
  }
  
  int patCode = readInt("write patient code: ");
  if (findPatient(patCode) == -1) {
    print("Patient not found");
    return;
  }

  int appNum = readInt("write appointment number: ");
  DateTime appDate = readDate("write appointment date");
  String diagnosis = readString("write diagnosis: ");
  
  appointments.add(Appointment(appNum, appDate, diagnosis, docCode, patCode));
  print("Appointment added");
}

void deleteDoctor() {
  int code = readInt("write doctor code to remove: ");
  int index = findDoctor(code);

  if (index == -1) {
    print("Doctor not found");
    return;
  }

  if (doctorHasAppointments(code)) {
    print("Deletion not allowed. Doctor has appointments.");
  } else {
    doctors.removeAt(index);
    print("Doctor removed.");
  }
}

void showAppointmentsByDate() {
  DateTime date = readDate("write date to search");
  bool found = false;
  
  for (Appointment app in appointments) {
    if (app.Data_consulta.year == date.year &&
        app.Data_consulta.month == date.month &&
        app.Data_consulta.day == date.day) {
      
      String docName = getDoctorName(app.Cod_medico);
      String patName = getPatientName(app.Cod_paciente);
      
      print("Appt: ${app.Num_prontuario}, Diag: ${app.Diagnostico}");
      print("  Doctor: $docName (Code: ${app.Cod_medico})");
      print("  Patient: $patName (Code: ${app.Cod_paciente})");
      found = true;
    }
  }

  if (!found) {
    print("No appointments found for this date.");
  }
}

void viewAllData() {
  print("DOCTORS");
  if (doctors.isEmpty) {
    print("No doctors.");
  } else {
    doctors.forEach((d) => print("Code: ${d.Cod_medico}, Name: ${d.Nome}"));
  }
  
  print("PATIENTS");
  if (patients.isEmpty) {
    print("No patients.");
  } else {
    patients.forEach((p) => print("Code: ${p.Cod_pac}, Name: ${p.Nome_pac}"));
  }
  
  print("APPOINTMENTS");
  if (appointments.isEmpty) {
    print("No appointments.");
  } else {
    appointments.forEach((a) => print("Appt: ${a.Num_prontuario}, Doc: ${a.Cod_medico}, Pat: ${a.Cod_paciente}"));
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Doctor");
    print("2. Update Doctor");
    print("3. Add Patient");
    print("4. Update Patient");
    print("5. Add Appointment");
    print("6. Delete Doctor");
    print("7. Show Appointments by Date");
    print("8. View All Data");
    print("9. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1: addDoctor(); break;
      case 2: updateDoctor(); break;
      case 3: addPatient(); break;
      case 4: updatePatient(); break;
      case 5: addAppointment(); break;
      case 6: deleteDoctor(); break;
      case 7: showAppointmentsByDate(); break;
      case 8: viewAllData(); break;
      case 9: print("Exited"); break;
      default: print("Invalid option.");
    }
  } while (option != 9);
}