import 'dart:io';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

void main() {
    File customerFileObject = File(customersFile);
    
    if (!customerFileObject.existsSync()) {
      customerFileObject.writeAsStringSync('[]');
      print('File $customersFile created.');
    } else {
      print('File $customersFile already exists.');
    }

    File paymentFileObject = File(paymentsFile);
    paymentFileObject.writeAsStringSync('[]');
    print('File $paymentsFile created.');
    
  }