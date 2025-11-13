import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/getCustomerName.dart';


const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

void main() {
  double minValue = readDouble('write the minimum value to search for:');

  List<dynamic> allCustomers = loadFile(customersFile);
  List<dynamic> allPayments = loadFile(paymentsFile);

  print('Payments with value > $minValue');
  bool found = false;

  for (var payment in allPayments) {
    if (payment['Valor_doc'] > minValue) {
      String customerName = getCustomerName(allCustomers, payment['Cod_Cli']);
      print(
          'Doc: ${payment['Num_doc']}, Value: ${payment['Valor_doc']}, Client: $customerName');
      found = true;
    }
  }

  if (!found) {
    print('No payments found with a value high than $minValue.');
  }
}



