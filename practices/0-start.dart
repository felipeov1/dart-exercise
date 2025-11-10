void main() {
  String name1 = "Felipe";
  int age = 20;
  double height = 1.80;
  bool isDeveloper = true;

  print(name1);
  print(age);

  String? nickname;

  nickname = "felipeov";

  print(nickname);

  String? name = "Felipe";
  String? lastName;

  print(name?.toLowerCase());
  print(lastName?.toLowerCase());

  final dataNascimento = buscarNoBanco();

  print(dataNascimento);

  const int maxCaracteresApelido = 15;

  String color = "green";

  if (color == "green") {
    print("Keep going");
  } else if (color == "yellow") {
    print("Pay attention, will close");
  } else {
    print("Stop!");
  }

  List<String> fruits = ["apple", "banana", "orange"];
  List<int> numbers = [1, 2, 3, 4, 5];
  List<double> prices = [10.5, 20.0, 30.75];
  List<bool> flags = [];

  print(fruits[0]);
  print(prices.length);

  fruits.add("grape");
  print(fruits);

  numbers.removeAt(1);
  print(numbers);

  print(flags.isEmpty);
  print(flags.isNotEmpty);

  List<int> scores = [10, 50, 30];
  scores.add(80);
  print(scores);

  for (int score in scores) {
    print("The scores is $score");
  }

  for (int i = 0; i < scores.length; i++) {
    print("The score at position $i is ${scores[i]}");
  }

  List<String> tasks = ["Study Dart", "Do exercises", "Sleep"];

  for (var task in tasks) {
    print(task);
  }

  sayHello("Felipe");

  print(sum(10, 20));

  print(isMajorAge(20));

  // String com espaços sobrando no início e fim
  String dirtyText = "   Hello, world!   \n";

  // Limpa os espaços das pontas
  String cleanText = dirtyText.trim();

  print("Original: '${dirtyText}'");
  print("Limpado: '${cleanText}'");

    // Uma string contendo valores separados por vírgula
  String csvData = "apple,banana,orange,grape";
  
  // Quebra a string usando a vírgula (',') como separador
  List<String> fruits1 = csvData.split(',');
  
  // Imprime a lista resultante
  print(fruits1); // Saída: [apple, banana, orange, grape]
  print(fruits1[1]); // Saída: banana

  
}

class Person {
  String name;
  Person(this.name);
  
  @override
  String toString() => "Person(name: $name)"; // Para imprimir bonito
}

void where() {
  List<Person> people = [
    Person("Ana"),
    Person("Bob"),
    Person("Charles"),
    Person("ana") // Um 'ana' com 'a' minúsculo
  ];
  
  String searchName = "ana"; // Termo de busca

  // Filtra a lista 'people'
  List<Person> results = people.where((p) => p.name.toLowerCase() == searchName.toLowerCase()).toList();
  
  // Imprime os resultados encontrados
  print(results); // Saída: [Person(name: Ana), Person(name: ana)]


    List<int> numbers = [1, 5, 9, 12, 15, 20];
  
  // Encontra o índice (posição) do primeiro número que é maior que 10
  int firstIndex = numbers.indexWhere((n) => n > 10);
  
  print(firstIndex); // Saída: 3 (porque o '12' está na posição 3)
  
  // Procura por um número maior que 100 (não existe)
  int notFoundIndex = numbers.indexWhere((n) => n > 100);
  
  print(notFoundIndex); // Saída: -1 (porque não encontrou)
}

buscarNoBanco() {
  return "2000-01-01";
}

void sayHello(String name) {
  print("Hello, $name!");
}

int sum(int a, int b) {
  return a + b;
}

bool isMajorAge(int age) => age >= 18;
