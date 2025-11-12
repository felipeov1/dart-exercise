import '../reads.dart';

class Account {
  final int documentNumber;
  final int clientCode;
  final DateTime dueDate;
  final DateTime paymentDate;
  final double accountValue;
  double interest = 0.0;

  Account(this.documentNumber, this.clientCode, this.dueDate, this.paymentDate, this.accountValue);
  
  void calculateInterest() {
    if (paymentDate.isAfter(dueDate)) {
      int daysLate = paymentDate.difference(dueDate).inDays;
      interest = accountValue * (0.0002 * daysLate);
    }
  }
}

List<Account> accounts = [];
const int maxAccounts = 15;

void readAllAccounts() {
  for (int i = 0; i < maxAccounts; i++) {
    print("write data for Account ${i + 1}");
    int docNum = readInt("write document number: ");
    int clientCode = readInt("write client code: ");
    DateTime dueDate = readDate("write due date");
    DateTime payDate = readDate("write payment date");
    double value = readDouble("write account value: ");

    Account newAccount = Account(docNum, clientCode, dueDate, payDate, value);
    newAccount.calculateInterest();
    
    accounts.add(newAccount);
    print("Account registered.");
  }
}

void showReport() {
  if (accounts.isEmpty) {
    print("No accounts to report.");
    return;
  }
  
  double totalToReceive = 0;
  double totalInterest = 0;
  
  for (Account acc in accounts) {
    print(
      "Doc: ${acc.documentNumber}, " +
      "Client: ${acc.clientCode}, " +
      "Value: ${acc.accountValue.toStringAsFixed(2)}, " +
      "Interest: ${acc.interest.toStringAsFixed(2)}"
    );
    totalToReceive += acc.accountValue + acc.interest;
    totalInterest += acc.interest;
  }
  
  double avgInterest = totalInterest / accounts.length;
  
  print("");
  print("Total to Receive: ${totalToReceive.toStringAsFixed(2)}");
  print("Average Interest: ${avgInterest.toStringAsFixed(2)}");
}

void main() {
  readAllAccounts();
  showReport();
}

