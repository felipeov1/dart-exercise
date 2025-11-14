import '../reads.dart';

String convertToWord(int num) {
  if (num == 10000) return "dez mil";
  if (num == 100) return "cem";

  final List<String> units = [
    "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"
  ];
  final List<String> teens = [
    "dez", "onze", "doze", "treze", "catorze", "quinze",
    "dezesseis", "dezessete", "dezoito", "dezenove"
  ];
  final List<String> tens = [
    "dez", "vinte", "trinta", "quarenta", "cinquenta",
    "sessenta", "setenta", "oitenta", "noventa"
  ];
  final List<String> hundreds = [
    "cento", "duzentos", "trezentos", "quatrocentos", "quinhentos",
    "seiscentos", "setecentos", "oitocentos", "novecentos"
  ];

  List<String> wordList = [];

  int thousands = num ~/ 1000;
  int remainder = num % 1000;

  if (thousands > 0) {
    wordList.add("${units[thousands - 1]} mil");
  }

  int hundred = remainder ~/ 100;
  remainder = remainder % 100;

  if (hundred > 0) {
    wordList.add(hundreds[hundred - 1]);
  }

  if (remainder > 0) {
    if (remainder < 10) {
      wordList.add(units[remainder - 1]);
    } else if (remainder < 20) {
      wordList.add(teens[remainder - 10]);
    } else {
      int ten = remainder ~/ 10;
      int unit = remainder % 10;
      
      wordList.add(tens[ten - 1]);
      
      if (unit > 0) {
        wordList.add(units[unit - 1]);
      }
    }
  }

  return wordList.join(" e ");
}

void main() {
  while (true) {
    int number = readInt("write a number (1-10000): ");

    if (number < 1 || number > 10000) {
      print("invalid number");
    } else {
      String words = convertToWord(number);
      print(words);
    }
  }
}
