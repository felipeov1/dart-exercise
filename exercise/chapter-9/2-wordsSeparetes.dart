import '../reads.dart';

void main() {
  String? input = readString("write the phrase: ");

  String write = input.trim();

  List<String> words = write.split('');

  for (String word in words) {
    print(word);
  }
}
