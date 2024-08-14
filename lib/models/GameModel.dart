class GameModel {
  int secretNumber;
  int attempts;
  List<int> greaterGuesses;
  List<int> lesserGuesses;
  int maxAttempts;

  GameModel({
    required this.secretNumber,
    required this.attempts,
    required this.greaterGuesses,
    required this.lesserGuesses,
    required this.maxAttempts,
  });



}