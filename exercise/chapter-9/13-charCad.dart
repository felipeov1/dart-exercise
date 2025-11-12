import '../reads.dart';

void main() {
  String text = readString("write a string: ");
  int count = readInt("write number of repetitions: ");

  int repetitions = count;
  
  if (count > 5) {
    repetitions = 5;
  }
  
  if (repetitions < 1) {
    repetitions = 1;
  }

  String newText = List.filled(repetitions, text).join(" ");
  
  print(newText);
}