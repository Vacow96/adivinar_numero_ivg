class GameModel {
  final int secretNumber;
  final int maxAttempts;
  final List<int> guesses;
  final List<bool> guessResults;

  GameModel({
    required this.secretNumber,
    required this.maxAttempts,
    required this.guesses,
    required this.guessResults,
  });
}