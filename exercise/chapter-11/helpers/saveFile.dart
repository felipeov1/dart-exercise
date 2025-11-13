import 'dart:io';
import 'dart:convert';
const String customersFile = 'exercise/chapter-11/files/customers.json';

void saveFile(String fileName, List<dynamic> data) {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');
  String jsonText = encoder.convert(data);
  File(fileName).writeAsStringSync(jsonText);
}

void saveCustomers(List<dynamic> customers) {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');
  String jsonText = encoder.convert(customers);

  File(customersFile).writeAsStringSync(jsonText);
}
