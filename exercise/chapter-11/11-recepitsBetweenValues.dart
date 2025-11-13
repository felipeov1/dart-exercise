import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/getCustomerName.dart';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

void main() {
  double minValue = readDouble('write the minimum value:');
  double maxValue = readDouble('write the maximum value:');

  List<dynamic> allCustomers = loadFile(customersFile);
  List<dynamic> allPayments = loadFile(paymentsFile);

  print('Payments with value between $minValue and $maxValue');
  bool found = false;

  for (var payment in allPayments) {
    double value = payment['Valor_doc'];
    if (value >= minValue && value <= maxValue) {
      String customerName = getCustomerName(allCustomers, payment['Cod_Cli']);
      print(
          'Doc: ${payment['Num_doc']}, Value: $value, Client: $customerName');
      found = true;
    }
  }

  if (!found) {
    print('No payments found in this range.');
  }
}