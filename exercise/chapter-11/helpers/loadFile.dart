import 'dart:io';
import 'dart:convert';


List<dynamic> loadFile(String fileName) {
  File file = File(fileName);

  if (file.existsSync()) {
    String jsonText = file.readAsStringSync();
    if (jsonText.isNotEmpty) {
      return jsonDecode(jsonText);
    }
  } else {
    print('File $fileName not found. Creating it.');
  }
  return [];
}

