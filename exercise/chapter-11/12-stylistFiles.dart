import 'dart:io';

const String stylistsFile = 'exercise/chapter-11/files/stylists/stylists.json';
const String seasonsFile = 'exercise/chapter-11/files/stylists/seasons.json';
const String clothingFile = 'exercise/chapter-11/files/stylists/clothing.json';

void main() {
  createFile(stylistsFile);
  createFile(seasonsFile);
  createFile(clothingFile);
}

void createFile(String fileName) {
  File file = File(fileName);
  if (file.existsSync()) {
    print('File $fileName already exists.');
  } else {
    file.writeAsStringSync('[]');
    print('File $fileName created.');
  }
}