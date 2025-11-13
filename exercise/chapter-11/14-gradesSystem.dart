import 'dart:io';
import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/saveFile.dart';

const String gradesFile = 'exercise/chapter-11/files/students/grades.json';

void createFile() {
  File file = File(gradesFile);
  if (file.existsSync()) {
    print('File $gradesFile already exists.');
  } else {
    file.writeAsStringSync('[]');
    print('File $gradesFile created.');
  }
}

void addRecord() {
  List<dynamic> allRecords = loadFile(gradesFile);

  int number = readInt('write Student Number:');

  for (var record in allRecords) {
    if (record['numero'] == number) {
      print('Student number already exists.');
      return;
    }
  }

  String name = readString('write Name:');
  double grade1 = readDouble('write Grade 1:');
  double grade2 = readDouble('write Grade 2:');

  allRecords.add({
    'numero': number,
    'nome': name,
    'nota1': grade1,
    'nota2': grade2,
  });

  saveFile(gradesFile, allRecords);
  print('Student record added.');
}

void showRecords() {
  List<dynamic> allRecords = loadFile(gradesFile);

  if (allRecords.isEmpty) {
    print('No records found.');
    return;
  }

  print('All Student Records');
  for (var record in allRecords) {
    double avg = (record['nota1'] + record['nota2']) / 2;
    print(
        'Num: ${record['numero']}, Name: ${record['nome']}, Avg: ${avg.toStringAsFixed(2)}');
  }
}

void main() {
  int option = 0;
  do {
    print('1. Create File');
    print('2. Add Record');
    print('3. Show Records');
    print('4. Exit');
    option = readInt('Choose an option: ');

    switch (option) {
      case 1:
        createFile();
        break;
      case 2:
        addRecord();
        break;
      case 3:
        showRecords();
        break;
      case 4:
        print('Exited');
        break;
      default:
        print('Invalid option.');
    }
  } while (option != 4);
}

