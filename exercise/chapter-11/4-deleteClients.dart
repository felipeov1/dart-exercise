import '../reads.dart';
import 'dart:convert';
import 'dart:io';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

void main() {
  int idToDelete = readInt('write Customer ID (Cod_Cli) to DELETE:');

  List<dynamic> allCustomers = loadFile(customersFile);

  int initialCustomerCount = allCustomers.length;

  allCustomers.removeWhere((customer) => customer['Cod_Cli'] == idToDelete);

  int finalCustomerCount = allCustomers.length;

  if (initialCustomerCount == finalCustomerCount) {
    print('Customer ID $idToDelete not found in $customersFile.');
    return;
  }

  print('Customer $idToDelete found.');
  saveFile(customersFile, allCustomers);
  print('Customer $idToDelete removed from $customersFile.');

  List<dynamic> allPayments = loadFile(paymentsFile);
  int initialPaymentCount = allPayments.length;

  allPayments.removeWhere((payment) => payment['Cod_Cli'] == idToDelete);

  int finalPaymentCount = allPayments.length;
  int paymentsDeleted = initialPaymentCount - finalPaymentCount;

  saveFile(paymentsFile, allPayments);
  print('$paymentsDeleted related payments removed from $paymentsFile.');

  print('Deletion process complete.');
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
