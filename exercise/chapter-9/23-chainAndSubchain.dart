import '../reads.dart';

void main() {
  String chain = readString("write the chain string: ");
  String subchain = readString("write the subchain: ");

  if (subchain.length > chain.length) {
    print("Subchain must be smaller than the chain.");
    return;
  }

  int count = RegExp(subchain).allMatches(chain).length;

  print("The subchain appears $count times");
}