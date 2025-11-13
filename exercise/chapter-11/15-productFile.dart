import 'dart:io';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  createFile(productsFile);
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
