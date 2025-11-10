import '../reads.dart';

void main() {
  int candidate1Votes = 0;
  int candidate2Votes = 0;
  int candidate3Votes = 0;
  int candidate4Votes = 0;
  int nullVotes = 0;
  int blankVotes = 0;
  int totalVotes = 0;
  int voteCode;

  while (true) {
    
    
    try {
      voteCode = readInt("Write the vote code (0 to exit): ");;
    } catch (e) {
      voteCode = -1;
    }

    if (voteCode == 0) {
      break;
    }

    switch (voteCode) {
      case 1:
        candidate1Votes++;
        totalVotes++;
        break;
      case 2:
        candidate2Votes++;
        totalVotes++;
        break;
      case 3:
        candidate3Votes++;
        totalVotes++;
        break;
      case 4:
        candidate4Votes++;
        totalVotes++;
        break;
      case 5:
        nullVotes++;
        totalVotes++;
        break;
      case 6:
        blankVotes++;
        totalVotes++;
        break;
      default:
        print("Invalid code.");
    }
  }

  if (totalVotes == 0) {
    print("No votes.");
  } else {
    double nullPercentage = (nullVotes / totalVotes) * 100.0;
    double blankPercentage = (blankVotes / totalVotes) * 100.0;

    print("Total votes for Candidate 1: $candidate1Votes");
    print("Total votes for Candidate 2: $candidate2Votes");
    print("Total votes for Candidate 3: $candidate3Votes");
    print("Total votes for Candidate 4: $candidate4Votes");
    print("Total null votes: $nullVotes");
    print("Total blank votes: $blankVotes");
    print("Total votes cast: $totalVotes");
    print("Percentage of null votes: ${nullPercentage.toStringAsFixed(2)}%");
    print("Percentage of blank votes: ${blankPercentage.toStringAsFixed(2)}%");
  }
}