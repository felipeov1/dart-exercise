import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/getCustomerName.dart';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';


void main() {
  int clientId = readInt('write Customer ID (Cod_Cli) to search:');

  List<dynamic> allCustomers = loadFile(customersFile);
  List<dynamic> allPayments = loadFile(paymentsFile);

  String clientName = getCustomerName(allCustomers, clientId);

  if (clientName == 'Unknown') {
    print('Customer ID $clientId not found.');
    return;
  }

  print('Payments for $clientName (ID: $clientId)');
  bool found = false;

  for (var payment in allPayments) {
    if (payment['Cod_Cli'] == clientId) {
      print(
          'Doc: ${payment['Num_doc']}, Value: ${payment['Valor_doc']}, Due: ${payment['Data_Vencimento']}');
      found = true;
    }
  }

  if (!found) {
    print('No payments found for this client.');
  }
}

