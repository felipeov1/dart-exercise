import '../reads.dart';

class Client {
  final int clientId;
  final String name;
  final String phone;
  final String address;

  Client(this.clientId, this.name, this.phone, this.address);
}

class Account {
  final int accountNumber;
  final int clientId;
  double balance;

  Account(this.accountNumber, this.clientId, this.balance);
}

Client? findClient(List<Client> clients, int id) {
  for (Client client in clients) {
    if (client.clientId == id) {
      return client;
    }
  }
  return null;
}

void registerClient(List<Client> clients) {
  int id = readInt("write new client ID: ");

  if (findClient(clients, id) != null) {
    print("Client ID already registered.");
    return;
  }

  String name = readString("write client name: ");
  String phone = readString("write client phone: ");
  String address = readString("write client address: ");

  clients.add(Client(id, name, phone, address));
  print("Client $name registered successfully.");
}

void registerAccount(List<Client> clients, List<Account> accounts) {
  int accountNum = readInt("write new account number: ");

  for (Account acc in accounts) {
    if (acc.accountNumber == accountNum) {
      print("Account number already exists.");
      return;
    }
  }

  int clientId = readInt("write the account holder's client ID: ");
  Client? client = findClient(clients, clientId);

  if (client == null) {
    print("Client not registered! Opening client registration screen...");

    registerClient(clients);

    if (findClient(clients, clientId) == null) {
      print("Account registration canceled.");
      return;
    }
  }

  double initialBalance = readDouble("write initial balance: ");

  accounts.add(Account(accountNum, clientId, initialBalance));
  print(
    "Account $accountNum registered for client ${client?.name ?? 'New Client'} successfully.",
  );
}

void displayAllAccounts(List<Client> clients, List<Account> accounts) {
  if (accounts.isEmpty) {
    print("No accounts registered.");
    return;
  }

  print("--- All Registered Accounts ---");
  for (Account account in accounts) {
    Client? holder = findClient(clients, account.clientId);
    String holderName = holder?.name ?? 'UNKNOWN CLIENT';

    print("Account No: ${account.accountNumber}");
    print("Client ID: ${account.clientId} (Name: $holderName)");
    print("Balance: \$${account.balance.toStringAsFixed(2)}");
    print("--------------------");
  }
}

void main() {
  List<Client> clients = [];
  List<Account> accounts = [];
  bool running = true;

  clients.add(Client(1, "John Smith", "555-1234", "101 Main St"));
  clients.add(Client(2, "Alice Jones", "555-5678", "202 Oak Ave"));
  accounts.add(Account(1001, 1, 500.00));
  accounts.add(Account(1002, 2, 1250.50));

  while (running) {
    print("--- Bank System Menu ---");
    print("1. Register Client");
    print("2. Register Account");
    print("3. Show All Accounts");
    print("4. Exit Program");

    int option = readInt("Select an option: ");

    switch (option) {
      case 1:
        registerClient(clients);
        break;
      case 2:
        registerAccount(clients, accounts);
        break;
      case 3:
        displayAllAccounts(clients, accounts);
        break;
      case 4:
        print("Program finalized. Goodbye!");
        running = false;
        break;
      default:
        print("Invalid option. Please try again.");
    }
  }
}
