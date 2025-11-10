import '../reads.dart';

void main() {
  String inputPhrase = readString("write the phrase to duplicate: ");

  String duplicatedPhrase = inputPhrase
      .split('')
      .map((char) => char * 2)
      .join();

  print(duplicatedPhrase);
}
