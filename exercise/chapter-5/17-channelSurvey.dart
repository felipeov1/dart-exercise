import '../reads.dart';

void main() {
  int viewersChannel4 = 0;
  int viewersChannel5 = 0;
  int viewersChannel7 = 0;
  int viewersChannel12 = 0;
  int totalViewers = 0;

  while (true) {
    int channel = readInt("Write the channel (4, 5, 7, 12) or 0 to exit: ");

    if (channel == 0) {
      break; 
    }

    int people = readInt("Write the  number of people watching: ");
    totalViewers += people;

    if (channel == 4) {
      viewersChannel4 += people;
    } else if (channel == 5) {
      viewersChannel5 += people;
    } else if (channel == 7) {
      viewersChannel7 += people;
    } else if (channel == 12) {
      viewersChannel12 += people;
    } else {
      print("Invalid channel");
      totalViewers -= people;
    }
  }


  if (totalViewers == 0) {
    print("No viewers recorded.");
  } else {
    double percent4 = (viewersChannel4 / totalViewers) * 100;
    double percent5 = (viewersChannel5 / totalViewers) * 100;
    double percent7 = (viewersChannel7 / totalViewers) * 100;
    double percent12 = (viewersChannel12 / totalViewers) * 100;

    print("Channel 4: ${percent4.toStringAsFixed(2)}%");
    print("Channel 5: ${percent5.toStringAsFixed(2)}%");
    print("Channel 7: ${percent7.toStringAsFixed(2)}%");
    print("Channel 12: ${percent12.toStringAsFixed(2)}%");
  }
}