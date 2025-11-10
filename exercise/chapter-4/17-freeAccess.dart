import '../reads.dart';

void main() {
  int code = readInt("Write your password: ");

  String access = code == 4531 ? "Permited" : "Not permited";

  print(access);
}
