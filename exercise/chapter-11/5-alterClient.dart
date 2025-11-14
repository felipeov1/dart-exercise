import '../reads.dart';
import './helpers/saveFile.dart';
import './helpers/loadFile.dart';

const String customersFile = 'exercise/chapter-11/files/customers.json';

void main() {
  int idToAlter = readInt('write Customer ID to ALTER:');
  List<dynamic> allCustomers = loadFile(customersFile);

  int index = allCustomers.indexWhere(
    (customer) => customer['Cod_Cli'] == idToAlter,
  );

  if (index == -1) {
    print('Customer ID $idToAlter not found in $customersFile.');
    return;
  }

  print('Current data:');
  print(allCustomers[index]);

  print('write the new data:');
  String newName = readString('new Nama: ');
  String newAddress = readString('new Address: ');

  allCustomers[index]['Nome'] = newName;
  allCustomers[index]['Endereco'] = newAddress;

  saveFile(customersFile, allCustomers);

  print('Customer updated');
  print('New data: ${allCustomers[index]}');
}

