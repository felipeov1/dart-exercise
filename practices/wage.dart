void main() {

print("The new wage is ${newWage(100)}");

}

double newWage(double actualWage) {
  if (actualWage <= 500) {
    return (20 / 100 * actualWage) + actualWage;
  }else{
    return (10 / 100 * actualWage) + actualWage;
  }
}
