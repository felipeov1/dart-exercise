import '../reads.dart';
import './helpers/saveFile.dart';
import './helpers/loadFile.dart';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

void main() {
  int docNumToAlter = readInt('write Document Number (Num_doc) to ALTER:');
  List<dynamic> allPayments = loadFile(paymentsFile);

  int index = allPayments.indexWhere(
    (payment) => payment['Num_doc'] == docNumToAlter,
  );

  if (index == -1) {
    print('Payment with Num_doc $docNumToAlter not found.');
    return;
  }

  print('Current payment data:');
  print(allPayments[index]);

  print('write the new data:');
  double newValue = readDouble('new Value (Valor_doc):');
  String newIssueDate = readString('new Issue Date (Data_Emissao):');
  String newDueDate = readString('new Due Date (Data_Vencimento):');

  allPayments[index]['Valor_doc'] = newValue;
  allPayments[index]['Data_Emissao'] = newIssueDate;
  allPayments[index]['Data_Vencimento'] = newDueDate;

  saveFile(paymentsFile, allPayments);

  print('Payment updated.');
  print('New data: ${allPayments[index]}');
}



