import '../reads.dart';
import 'dart:convert';
import 'dart:io';

const String customersFile = 'exercise/chapter-11/files/customers.json';

void main() {
  int idToAlter = readInt('write Customer ID (Cod_Cli) to ALTER:');
  List<dynamic> allCustomers = loadFile(customersFile);

  int index = allCustomers.indexWhere(
    (customer) => customer['Cod_Cli'] == idToAlter,
  );

  if (index == -1) {
    print('Customer ID $idToAlter not found in $customersFile.');
    return;
  }

  print('Customer data:');
  print(allCustomers[index]);

  print('write the new data:');
  String newName = readString('new Name (Nome):');
  String newAddress = readString('new Address (Endereco):');

  allCustomers[index]['Nome'] = newName;
  allCustomers[index]['Endereco'] = newAddress;

  saveFile(customersFile, allCustomers);

  print('New data: ${allCustomers[index]}');
}

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

void saveFile(String fileName, List<dynamic> data) {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');
  String jsonText = encoder.convert(data);
  File(fileName).writeAsStringSync(jsonText);
}
