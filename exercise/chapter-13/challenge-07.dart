import 'dart:math';
import '../reads.dart';

(List<String>, List<String>) registerWordsAndTips() {
  List<String> words = [];
  List<String> tips = [];

  for (int i = 0; i < 10; i++) {
    String word = readString("Write the word ${i + 1}: ");
    words.add(word.toLowerCase());
    
    String tip = readString("Write a tip for this word: ");
    tips.add(tip);
  }

  return (words, tips);
}

int drawWord(List<String> words) {
  if (words.isEmpty) {
    return -1;
  }

  final random = Random();
  int randomIndex = random.nextInt(words.length);
  return randomIndex;
}

void playGame(String word, String tip) {
  List<String> hiddenDisplay = List.filled(word.length, '_');
  List<String> guessedLetters = [];
  int chances = 7; 

  while (chances > 0) {
    print("Word: ${hiddenDisplay.join(' ')}");
    print("Chances left: $chances");
    print("Guessed letters: ${guessedLetters.join(', ')}");

    if (chances == 1) {
      print("HINT: $tip");
    }

    String letter = readString("write a letter: ");

    if (letter.isEmpty || letter.length > 1) {
      print("Invalid input. Please write only one letter.");
      continue;
    }

    letter = letter.toLowerCase();

    if (guessedLetters.contains(letter)) {
      print("You already guessed that letter. Try again.");
      continue;
    }

    guessedLetters.add(letter);

    bool foundLetter = false;
    for (int i = 0; i < word.length; i++) {
      if (word[i] == letter) {
        hiddenDisplay[i] = word[i];
        foundLetter = true;
      }
    }

    if (foundLetter) {
      print("Good guess!");
      if (!hiddenDisplay.contains('_')) {
        print("You win!");
        return; 
      }
    } else {
      print("Wrong guess!");
      chances--;
    }
  }
  if (chances == 0) {
    print("The word was: $word");
  }
}

void main() {
  var (words, tips) = registerWordsAndTips();
  String playAgain;
  do {
    int wordIndex = drawWord(words);
    if (wordIndex == -1) {
      print("No words to play with!");
      return;
    }
    
    String selectedWord = words[wordIndex];
    String selectedTip = tips[wordIndex];

    playGame(selectedWord, selectedTip);
    
    playAgain = readString("Play again? (y/n): ").toLowerCase();
  } while (playAgain == 'y');
}