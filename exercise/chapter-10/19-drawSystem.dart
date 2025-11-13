import '../reads.dart';
import 'dart:math';

class Client {
  final int registerNumber;
  String name;
  final String birthDate;
  final String cpf;
  final String rg;
  String city;
  String address;
  int quantity;

  Client(
    this.registerNumber,
    this.name,
    this.birthDate,
    this.cpf,
    this.rg,
    this.city,
    this.address,
    this.quantity,
  );
}

List<Client> clients = [];

void addClient() {
  int regNum = readInt("write register number (1-9999): ");
  if (regNum < 1 || regNum > 9999) {
    print("Invalid register number.");
    return;
  }

  if (findClient(regNum) != -1) {
    print("Register number exists");
    return;
  }

  String name = readString("write client name: ");
  String birthDate = readString("write birth date (DD/MM/YYYY): ");
  String cpf = readString("write CPF: ");
  String rg = readString("write RG: ");
  String city = readString("write city: ");
  String address = readString("write address: ");
  int quantity = readInt("write quantity of equipaments: ");

  clients.add(
    Client(regNum, name, birthDate, cpf, rg, city, address, quantity),
  );
  print("Client added.");
}

int findClient(int registerNumber) {
  for (int i = 0; i < clients.length; i++) {
    if (clients[i].registerNumber == registerNumber) {
      return i;
    }
  }
  return -1;
}

void getWinnerDraw() {
  if (clients.isEmpty) {
    print("No clients registered.");
    return;
  }

  Random random = Random();
  int winningNumber = random.nextInt(9999) + 1;
  print("Draw number: $winningNumber");

  int index = findClient(winningNumber);

  if (index == -1) {
    print("No client has this register number.");
    return;
  }

  Client potentialWinner = clients[index];

  if (potentialWinner.quantity > 5) {
    print("The winner is: ${potentialWinner.name}");
    print("CPF: ${potentialWinner.cpf}");
    print("Address: ${potentialWinner.address}, ${potentialWinner.city}");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Client");
    print("2. Find the winner");
    print("3. Exit");
    option = readInt("choose an option: ");

    switch (option) {
      case 1:
        addClient();
        break;
      case 2:
        getWinnerDraw();
        break;
      case 3:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 3);
}
