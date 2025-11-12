import '../reads.dart';

void main() {
  String verb = readString("write a regular verb ending in ER: ");

  String conjuctionVerb = "";
  for (int i = 0; i < verb.length - 2; i++) {
    conjuctionVerb += verb[i];
  }

  print("Eu ${conjuctionVerb}o");
  print("Tu ${conjuctionVerb}es");
  print("Ele ${conjuctionVerb}e");
  print("Ela ${conjuctionVerb}e");
  print("Nós ${conjuctionVerb}emos");
  print("Vós ${conjuctionVerb}eis");
  print("Eles ${conjuctionVerb}em");
  print("Elas ${conjuctionVerb}em");
}