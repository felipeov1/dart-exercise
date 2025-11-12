
import '../reads.dart';

class Client {
  final int clientCode;
  String clientName;

  Client(this.clientCode, this.clientName);
}

class PurchaseAccount {
  final int accountNumber;
  double purchaseValue;
  final int clientCode;

  PurchaseAccount(this.accountNumber, this.purchaseValue, this.clientCode);
}

List<Client> clients = [];
List<PurchaseAccount> accounts = [];

int findClientIndex(int code) {
  for (int i = 0; i < clients.length; i++) {
    if (clients[i].clientCode == code) {
      return i;
    }
  }
  return -1;
}

bool clientHasAccounts(int clientCode) {
  for (PurchaseAccount acc in accounts) {
    if (acc.clientCode == clientCode) {
      return true;
    }
  }
  return false;
}

void addClient() {
  int code = readInt("write client code: ");
  int index = findClientIndex(code);

  if (index != -1) {
    print("Client exists.");
    return;
  }

  String name = readString("write client name: ");
  Client newClient = Client(code, name);
  clients.add(newClient);
  print("Client added successfully.");
}

void addAccount() {
  int clientCode = readInt("write client code to link: ");
  int clientIndex = findClientIndex(clientCode);

  if (clientIndex == -1) {
    print("Client code not found. Cannot add account.");
    return;
  }

  int accNum = readInt("write new account number: ");
  double value = readDouble("write purchase value: ");
  
  PurchaseAccount newAccount = PurchaseAccount(accNum, value, clientCode);
  accounts.add(newAccount);
  print("Account added");
}

void removeClient() {
  int code = readInt("write client code to remove: ");
  int index = findClientIndex(code);

  if (index == -1) {
    print("Client not found.");
    return;
  }

  bool hasAccounts = clientHasAccounts(code);

  if (hasAccounts) {
    print("Deletion not allowed. Client has accounts");
  } else {
    clients.removeAt(index);
    print("Client removed");
  }
}

void viewLists() {
  print("CLIENTS");
  if (clients.isEmpty) {
    print("No clients.");
  } else {
    clients.forEach((c) => print("Code: ${c.clientCode}, Name: ${c.clientName}"));
  }
  
  print("ACCOUNTS");
  if (accounts.isEmpty) {
    print("No accounts.");
  } else {
    accounts.forEach((a) => print("Acc: ${a.accountNumber}, Value: ${a.purchaseValue}, ClientCode: ${a.clientCode}"));
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Client");
    print("2. Add Account");
    print("3. Remove Client");
    print("4. View Lists");
    print("5. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        addClient();
        break;
      case 2:
        addAccount();
        break;
      case 3:
        removeClient();
        break;
      case 4:
        viewLists();
        break;
      case 5:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 5);
}