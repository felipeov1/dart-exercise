import '../reads.dart';

String sortString(String input) {
  List<String> list = input.split('');
  list.sort();
  return list.join();
}

void main() {
  String string1 = readString("write the first string: ");
  String string2 = readString("write the second string: ");

  if (string1.length != string2.length) {
    print("$string1 isn't a permutation of $string2");
  } else {
    String sortedS1 = sortString(string1);
    String sortedS2 = sortString(string2);

    if (sortedS1 == sortedS2) {
      print("$string1 is a permutation of $string2");
    } else {
      print("$string2 isn't a permutation of $string1");
    }
  }
}
