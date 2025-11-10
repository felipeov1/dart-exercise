void main() {
  String simpleString = 'Hello, Dart!';
  String emptyString = '';

  String user = 'Alice';
  int age = 30;
  String greeting = 'Hello, $user. Next year you will be ${age + 1}.';
  print('1. Interpolação: $greeting');

  String checkString = "apple";

  print('2.1. Tamanho: ${checkString.length}');
  print('2.2. Vazia? ${emptyString.isEmpty}');
  print('2.3. Contém "pp"? ${checkString.contains('pp')}');
  print('2.4. Começa com "a"? ${checkString.startsWith('a')}');

  String messyString = 'data to clean';

  String cleanResult = messyString.trim();
  print('3.1. .trim(): "${cleanResult}"');

  String leftTrimResult = messyString.trimLeft();
  print('3.2. .trimLeft(): "${leftTrimResult}"');

  String dataString = 'Dart,Flutter,Mobile,Web';

  List<String> parts = dataString.split(',');
  print("4.1. .split(','): $parts");

  String original = 'Mixed Case Text';
  String numbers = '123456789';

  print('5.1. .toUpperCase(): ${original.toUpperCase()}');
  print('5.2. .toLowerCase(): ${original.toLowerCase()}');

  String replaced = original.replaceAll('Case', 'STYLE');
  print('5.3. .replaceAll(): $replaced');

  String sub = numbers.substring(2, 5);
  print('5.4. .substring(2, 5): $sub');

  String joined = parts.join(' | ');
  print('5.5. .join(" | "): $joined');

  String wordToReverse = 'DART';

  String reversedWord = wordToReverse.split('').reversed.join();
  print('6. Inversão: $reversedWord');
}
