import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/saveFile.dart';


const String stylistsFile = 'exercise/chapter-11/files/stylists/stylists.json';
const String seasonsFile = 'exercise/chapter-11/files/stylists/seasons.json';
const String clothingFile = 'exercise/chapter-11/files/stylists/clothing.json';

void addStylist() {
  List<dynamic> allStylists = loadFile(stylistsFile);
  
  int id = readInt('write Stylist ID:');
  String name = readString('write Name:');
  double salary = readDouble('write Salary:');

  for (var stylist in allStylists) {
    if (stylist['Cod_Estilista'] == id) {
      print('Stylist ID already exists.');
      return;
    }
  }

  allStylists.add({
    'Cod_Estilista': id,
    'Nome': name,
    'Salario': salary,
  });

  saveFile(stylistsFile, allStylists);
  print('Stylist registered.');
}

void addSeason() {
  List<dynamic> allSeasons = loadFile(seasonsFile);
  
  int id = readInt('write Season ID:');
  String name = readString('write Name: ');

  for (var season in allSeasons) {
    if (season['Cod_Estacao'] == id) {
      print('Season ID already exists.');
      return;
    }
  }

  allSeasons.add({
    'Cod_Estacao': id,
    'Nome_Estacao': name,
  });

  saveFile(seasonsFile, allSeasons);
  print('Season registered.');
}

void addClothing() {
  List<dynamic> allStylists = loadFile(stylistsFile);
  List<dynamic> allSeasons = loadFile(seasonsFile);
  List<dynamic> allClothing = loadFile(clothingFile);

  int stylistId = readInt('write Stylist ID0:');
  bool stylistExists = allStylists.any((s) => s['Cod_Estilista'] == stylistId);
  if (!stylistExists) {
    print('Stylist ID not found.');
    return;
  }

  int seasonId = readInt('write Season ID: ');
  bool seasonExists = allSeasons.any((s) => s['Cod_Estacao'] == seasonId);
  if (!seasonExists) {
    print('Season ID not found.');
    return;
  }

  int clothingId = readInt('write Clothing ID: ');
  String description = readString('write Description: ');
  int year = readInt('write Year: ');

  allClothing.add({
    'Cod_Roupa': clothingId,
    'Descricao': description,
    'Cod_Estilista': stylistId,
    'Cod_Estacao': seasonId,
    'Ano': year,
  });

  saveFile(clothingFile, allClothing);
  print('Clothing registered.');
}

String getStylistName(List<dynamic> stylists, int id) {
  for (var stylist in stylists) {
    if (stylist['Cod_Estilista'] == id) {
      return stylist['Nome'];
    }
  }
  return 'Unknown';
}

void showReportBySeason() {
  int seasonId = readInt('write Season ID to report:');

  List<dynamic> allStylists = loadFile(stylistsFile);
  List<dynamic> allSeasons = loadFile(seasonsFile);
  List<dynamic> allClothing = loadFile(clothingFile);

  bool seasonFound = false;
  for (var season in allSeasons) {
    if (season['Cod_Estacao'] == seasonId) {
      print('Report for Season: ${season['Nome_Estacao']}');
      seasonFound = true;
      break;
    }
  }

  if (!seasonFound) {
    print('Season not found.');
    return;
  }

  bool clothingFound = false;
  for (var item in allClothing) {
    if (item['Cod_Estacao'] == seasonId) {
      String stylistName = getStylistName(allStylists, item['Cod_Estilista']);
      print('Desc: ${item['Descricao']}, Year: ${item['Ano']}, Stylist: $stylistName');
      clothingFound = true;
    }
  }

  if (!clothingFound) {
    print('No clothing foundn');
  }
}


void main() {
  int option = 0;
  do {
    print('1. Register Stylist');
    print('2. Register Season');
    print('3. Register Clothing');
    print('4. Report by Season');
    print('5. Exit');
    option = readInt('Choose an option: ');

    switch (option) {
      case 1: addStylist(); break;
      case 2: addSeason(); break;
      case 3: addClothing(); break;
      case 4: showReportBySeason(); break;
      case 5: print('Exited'); break;
      default: print('Invalid option.');
    }
  } while (option != 5);
}



