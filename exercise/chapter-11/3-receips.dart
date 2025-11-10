import 'dart:io';
import 'dart:convert';
import '../reads.dart';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

void main() {
  int docNum = readInt('write Document Number (Num_doc):');
  double value = readDouble('write Value (Valor_doc):');
  String issue = readString('write Issue Date (Data_Emissao):');
  String due = readString('write Due Date (Data_Vencimento):');
  int customerId = readInt('write Customer ID (Cod_Cli) for this payment:');

  List<dynamic> allCustomers = loadFile(customersFile);

  bool customerExists = false;

  for (var customer in allCustomers) {
    if (customer['Cod_Cli'] == customerId) {
      customerExists = true;
      print('Customer $customerId found (Name: ${customer['Nome']}).');
      break;
    }
  }

  if (!customerExists) {
    print('Customer ID $customerId not found in $customersFile.');
    return;
  }

  print('Proceeding with payment registration.');

  Map<String, dynamic> newPayment = {
    'Num_doc': docNum,
    'Valor_doc': value,
    'Data_Emissao': issue,
    'Data_Vencimento': due,
    'Cod_Cli': customerId,
  };

  List<dynamic> allPayments = loadFile(paymentsFile);

  allPayments.add(newPayment);

  saveFile(paymentsFile, allPayments);

  print('Payment registered for customer $customerId!');
  print('Data saved to $paymentsFile.');
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
