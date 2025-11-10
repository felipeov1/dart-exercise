import 'dart:io';
import '../reads.dart';


class Account {
  final int number;
  final String name;
  double balance;

  Account(this.number, this.name, this.balance);
}

List<Account> accounts = [];
const int maxAccounts = 15;


int findAccountIndex(int number) {
  for (int i = 0; i < accounts.length; i++) {
    if (accounts[i].number == number) {
      return i;
    }
  }
  return -1;
}

void registerAccount() {
  if (accounts.length >= maxAccounts) {
    print("Maximum accounts registered");
    return;
  }

  int newNumber = readInt("Write account number: ");
  int index = findAccountIndex(newNumber);

  if (index != -1) {
    print("Account number already exists.");
    return;
  }

  String newName = readString("Write client name: ");
  double initialBalance = readDouble("Write initial balance: ");

  Account newAccount = Account(newNumber, newName, initialBalance);
  accounts.add(newAccount);
  print("Account registered successfully.");
}

void consultAccountByName() {
  String searchName = readString("Write the client name to consult: ");
  
  List<Account> foundAccounts = accounts.where((a) => a.name.toLowerCase() == searchName.toLowerCase()).toList();

  if (foundAccounts.isEmpty) {
    print("No accounts found for client \"$searchName\".");
    return;
  }
  
  print("--- Accounts for $searchName ---");
  for (Account account in foundAccounts) {
    print("Number: ${account.number} | Balance: \$${account.balance.toStringAsFixed(2)}");
  }
}

void deleteLowestBalanceAccount() {
  if (accounts.isEmpty) {
    print("No accounts registered.");
    return;
  }

  double lowestBalance = double.infinity;
  int lowestIndex = -1;

  for (int i = 0; i < accounts.length; i++) {
    if (accounts[i].balance < lowestBalance) {
      lowestBalance = accounts[i].balance;
      lowestIndex = i;
    }
  }
  
  if (lowestIndex != -1) {
    Account deletedAccount = accounts.removeAt(lowestIndex);
    print("Account deleted.");
    print("Deleted Account Details: Number: ${deletedAccount.number}, Balance: \$${deletedAccount.balance.toStringAsFixed(2)}");
  } else {
    print("not find account with lowest balance.");
  }
}

void main() {
  int option = 0;

  do {
    print("1. Register Account");
    print("2. Consult Accounts by Name");
    print("3. Delete Account with Lowest Balance");
    print("4. Exit");
    
    stdout.write("Choose an option: ");
    String? input = stdin.readLineSync();
    option = int.tryParse(input ?? "") ?? 0;

    switch (option) {
      case 1:
        registerAccount();
        break;
      case 2:
        consultAccountByName();
        break;
      case 3:
        deleteLowestBalanceAccount();
        break;
      case 4:
        print("Program finalized. Goodbye.");
        break;
      default:
        print("Invalid option. Try again.");
    }
  } while (option != 4);
}