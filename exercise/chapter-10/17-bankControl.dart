import '../reads.dart';

class Client {
  final int cpfCnpj;
  String name;
  int age;
  String address;

  Client(this.cpfCnpj, this.name, this.age, this.address);
}

class Account {
  final int accountNumber;
  final int cpfCnpj;
  double balance;

  Account(this.accountNumber, this.cpfCnpj, this.balance);
}

List<Client> clients = [];
List<Account> accounts = [];

const int maxAccountsPerClient = 15;
const int maxTotalAccounts = 48;


void addClient() {
  int cpf = readInt("write client CPF/CNPJ: ");
  if (findClient(cpf) != -1) {
    print("Client code exists.");
    return;
  }
  String name = readString("write client name: ");
  int age = readInt("write client age: ");
  String address = readString("write client address: ");
  
  clients.add(Client(cpf, name, age, address));
  print("Client added.");
}

void addAccount() {
  if (accounts.length >= maxTotalAccounts) {
    print("Bank is full (max 48 accounts).");
    return;
  }

  int accNum = readInt("write new account number: ");
  if (accNum == 0) {
    print("Account number cannot be zero.");
    return;
  }
  if (findAccount(accNum) != -1) {
    print("Account number exists.");
    return;
  }

  int cpf = readInt("write client CPF/CNPJ to link: ");
  if (findClient(cpf) == -1) {
    print("Client not found.");
    return;
  }

  if (countClientAccounts(cpf) >= maxAccountsPerClient) {
    print("Client has reached max accounts (15).");
    return;
  }
  
  double balance = readDouble("write initial balance: ");
  accounts.add(Account(accNum, cpf, balance));
  print("Account added.");
}


int findClient(int cpf) {
  for (int i = 0; i < clients.length; i++) {
    if (clients[i].cpfCnpj == cpf) {
      return i;
    }
  }
  return -1;
}

int findAccount(int accNum) {
  for (int i = 0; i < accounts.length; i++) {
    if (accounts[i].accountNumber == accNum) {
      return i;
    }
  }
  return -1;
}

String getClientName(int cpf) {
  int index = findClient(cpf);
  return (index == -1) ? "Unknown" : clients[index].name;
}

int countClientAccounts(int cpf) {
  int count = 0;
  for (Account acc in accounts) {
    if (acc.cpfCnpj == cpf) {
      count++;
    }
  }
  return count;
}


void showAllAccounts() {
  if (accounts.isEmpty) {
    print("No accounts registered.");
    return;
  }
  
  for (Account acc in accounts) {
    String clientName = getClientName(acc.cpfCnpj);
    print("Num: ${acc.accountNumber}, Client: $clientName, Bal: ${acc.balance}");
  }
}

void showClientAccounts() {
  int cpf = readInt("write client CPF/CNPJ: ");
  if (findClient(cpf) == -1) {
    print("Client not found.");
    return;
  }
  
  print("Accounts for ${getClientName(cpf)}:");
  bool found = false;
  for (Account acc in accounts) {
    if (acc.cpfCnpj == cpf) {
      print("Num: ${acc.accountNumber}, Bal: ${acc.balance}");
      found = true;
    }
  }
  if (!found) {
    print("No accounts found");
  }
}

void showClientTotal() {
  int cpf = readInt("write client CPF/CNPJ: ");
  if (findClient(cpf) == -1) {
    print("Client not found.");
    return;
  }

  double total = 0;
  for (Account acc in accounts) {
    if (acc.cpfCnpj == cpf) {
      total += acc.balance;
    }
  }
  print("Total balance for ${getClientName(cpf)}: ${total.toStringAsFixed(2)}");
}

void showNegativeAccounts() {
  print("NEGATIVE BALANCE ACCOUNTS");
  bool found = false;
  for (Account acc in accounts) {
    if (acc.balance < 0) {
      print("Num: ${acc.accountNumber}, Bal: ${acc.balance}");
      found = true;
    }
  }
  if (!found) {
    print("No accounts");
  }
}

void showTotalAssets() {
  double total = 0;
  for (Account acc in accounts) {
    total += acc.balance;
  }
  print("Bank Total Assets: ${total.toStringAsFixed(2)}");
}

void main() {
  int option = 0;
  do {
    print("1. Add Client");
    print("2. Add Account");
    print("3. Show All Accounts");
    print("4. Show Client's Accounts");
    print("5. Show Client's Total Balance");
    print("6. Show Negative Accounts");
    print("7. Show Total Bank Assets");
    print("8. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1: addClient(); break;
      case 2: addAccount(); break;
      case 3: showAllAccounts(); break;
      case 4: showClientAccounts(); break;
      case 5: showClientTotal(); break;
      case 6: showNegativeAccounts(); break;
      case 7: showTotalAssets(); break;
      case 8: print("Exited"); break;
      default: print("Invalid option.");
    }
  } while (option != 8);
}