
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/GameModel.dart';

enum Difficulty { easy, medium, hard, extreme }

class GameViewModel extends ChangeNotifier {
  GameModel? _gameModel;
  Difficulty? _difficulty;
  TextEditingController guessController = TextEditingController();
  String? inputError;
  String resultMessage = '';

  void setDifficulty(Difficulty difficulty) {
    _difficulty = difficulty;
    _startNewGame();
  }

  void _startNewGame() {
    int range;
    int attempts;

    switch (_difficulty) {
      case Difficulty.easy:
        range = 10;
        attempts = 5;
        break;
      case Difficulty.medium:
        range = 20;
        attempts = 8;
        break;
      case Difficulty.hard:
        range = 100;
        attempts = 15;
        break;
      case Difficulty.extreme:
        range = 1000;
        attempts = 25;
        break;
      default:
        range = 10;
        attempts = 5;
    }

    _gameModel = GameModel(
      secretNumber: Random().nextInt(range) + 1,
      maxAttempts: attempts,
      guesses: [],
      guessResults: [],
    );

    resultMessage = '';
    guessController.clear();
    inputError = null;
    notifyListeners();
  }

  void makeGuess() {
    if (_gameModel == null) return;

    final guess = int.tryParse(guessController.text);
    if (guess == null || guess < 1 || guess > (_gameModel!.secretNumber * 2)) {
      inputError = 'Ingrese un número válido dentro del rango permitido';
      notifyListeners();
      return;
    }

    inputError = null;
    _gameModel!.guesses.add(guess);
    final isCorrect = guess == _gameModel!.secretNumber;
    _gameModel!.guessResults.add(isCorrect);

    if (isCorrect) {
      resultMessage = '¡Correcto! Adivinaste el número secreto.';
    } else {
      resultMessage = 'Incorrecto. Sigue intentando.';
    }

    if (_gameModel!.guesses.length >= _gameModel!.maxAttempts) {
      resultMessage = isCorrect ? resultMessage : 'No adivinaste el número secreto.';
    }

    notifyListeners();
  }

  void resetGame() {
    _startNewGame();
  }

  List<int> get guesses => _gameModel?.guesses ?? [];
  List<bool> get guessResults => _gameModel?.guessResults ?? [];
}