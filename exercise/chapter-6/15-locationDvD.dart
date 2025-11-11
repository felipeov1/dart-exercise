import '../reads.dart';

void main() {
  const int totalClients = 8;
  
  List<String> clientNames = [];
  List<int> dvdCounts = [];

  for (int i = 0; i < totalClients; i++) {
    String name = readString("Write the name for client ${i + 1}: ");
    int dvds = readInt("Write the 2011 DVD count for $name: ");
    
    clientNames.add(name);
    dvdCounts.add(dvds);
  }

  for (int i = 0; i < totalClients; i++) {
    String name = clientNames[i];
    int dvds = dvdCounts[i];
    
    int freeLocation = dvds ~/ 10;
    
    print("Client: $name, Free location: $freeLocation");
  }
}