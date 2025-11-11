void main() {
  List<int> numbers = [
    42, 17, 88, 5, 63, 29, 91, 12, 77, 3, 50, 68, 22, 99, 31
  ];

  int highestNumber = numbers[0];
  int highestIndex = 0;
  
  int lowestNumber = numbers[0];
  int lowestIndex = 0;


  for (int i = 1; i < numbers.length; i++) {
    
    if (numbers[i] > highestNumber) {
      highestNumber = numbers[i];
      highestIndex = i;
    }
    
    if (numbers[i] < lowestNumber) {
      lowestNumber = numbers[i];
      lowestIndex = i;
    }
  }


  print("Largest Number: $highestNumber. Position $highestIndex");
  print("Smallest Number: $lowestNumber. Position $lowestIndex");
}