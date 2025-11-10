import '../reads.dart';
import 'dart:io';
import 'dart:convert';

const String customersFile = 'exercise/chapter-11/files/customers.json';

void main() {
  int id = readInt('write Customer ID (Cod_Cli):');
  String name = readString('write Name (Nome):');
  String address = readString('write Address (Endereco):');

  Map<String, dynamic> newCustomer = {
    'Cod_Cli': id,
    'Nome': name,
    'Endereco': address,
  };

  List<dynamic> allCustomers = loadCustomers();

  allCustomers.add(newCustomer);

  saveCustomers(allCustomers);

  print('Sustomer registered');
  print('$newCustomer');
}

List<dynamic> loadCustomers() {
  File file = File(customersFile);

  if (file.existsSync()) {
    String jsonText = file.readAsStringSync();

    if (jsonText.isNotEmpty) {
      return jsonDecode(jsonText);
    }
  }
  return [];
}

void saveCustomers(List<dynamic> customers) {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');
  String jsonText = encoder.convert(customers);

  File(customersFile).writeAsStringSync(jsonText);
}
