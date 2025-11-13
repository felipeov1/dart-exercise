import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/getCustomerName.dart';

const String customersFile = 'exercise/chapter-11/files/customers.json';
const String paymentsFile = 'exercise/chapter-11/files/payments.json';

DateTime? parseDate(String dateStr) {
  try {
    List<String> parts = dateStr.split('/');
    if (parts.length != 3) return null;
    int? day = int.tryParse(parts[0]);
    int? month = int.tryParse(parts[1]);
    int? year = int.tryParse(parts[2]);
    if (day != null && month != null && year != null) {
      return DateTime(year, month, day);
    }
  } catch (e) {
    return null;
  }
  return null;
}


void main() {
  print('write the period to search.');
  DateTime? startDate = parseDate(readString('Start Date (DD/MM/YYYY): '));
  DateTime? endDate = parseDate(readString('End Date (DD/MM/YYYY): '));

  if (startDate == null || endDate == null) {
    print('Invalid date format.');
    return;
  }

  if (endDate.isBefore(startDate)) {
    print('End date must be after start date.');
    return;
  }

  List<dynamic> allCustomers = loadFile(customersFile);
  List<dynamic> allPayments = loadFile(paymentsFile);
  DateTime now = DateTime.now();
  bool found = false;

  print('Payments Due Between ${formatDate(startDate)} and ${formatDate(endDate)}');

  for (var payment in allPayments) {
    DateTime? dueDate = parseDate(payment['Data_Vencimento']);

    if (dueDate != null) {
      if (!dueDate.isBefore(startDate) && !dueDate.isAfter(endDate)) {
        found = true;
        String customerName = getCustomerName(allCustomers, payment['Cod_Cli']);
        int daysOverdue = 0;
        
        if (dueDate.isBefore(now)) {
          daysOverdue = now.difference(dueDate).inDays;
        }

        print('Doc: ${payment['Num_doc']}, Value: ${payment['Valor_doc']}');
        print('  Client: $customerName (ID: ${payment['Cod_Cli']})');
        print('  Due Date: ${payment['Data_Vencimento']}, Overdue: $daysOverdue days');
      }
    }
  }

  if (!found) {
    print('No payments found in this period.');
  }
}

String formatDate(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

