import '../reads.dart';

void main() {
  String phrase = readString("Write the phrase: ");

  String trimmedPhrase = phrase.trim();

  print("$trimmedPhrase");
}
 