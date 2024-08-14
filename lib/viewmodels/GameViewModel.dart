
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/GameModel.dart';

class GameViewModel with ChangeNotifier {
  late GameModel _game;
  late int _range;
  late int _maxAttempts;

  GameModel get game => _game;

  GameViewModel() {
    _initializeGame(10, 5); // Default to Easy
  }

  void _initializeGame(int range, int maxAttempts) {
    _range = range;
    _maxAttempts = maxAttempts;
    _game = GameModel(
      secretNumber: Random().nextInt(_range) + 1,
      attempts: 0,
      greaterGuesses: [],
      lesserGuesses: [],
      maxAttempts: _maxAttempts,
    );
    notifyListeners();
  }

  void setDifficulty(String difficulty) {
    switch (difficulty) {
      case 'Fácil':
        _initializeGame(10, 5);
        break;
      case 'Medio':
        _initializeGame(20, 8);
        break;
      case 'Avanzado':
        _initializeGame(100, 15);
        break;
      case 'Extremo':
        _initializeGame(1000, 25);
        break;
    }
  }

  String makeGuess(int guess) {
    if (guess < 1 || guess > _range) {
      return 'Por favor, ingrese un número entre 1 y $_range.';
    }
    _game.attempts++;
    if (guess > _game.secretNumber) {
      _game.greaterGuesses.add(guess);
      notifyListeners();
      return 'El número es menor que $guess.';
    } else if (guess < _game.secretNumber) {
      _game.lesserGuesses.add(guess);
      notifyListeners();
      return 'El número es mayor que $guess.';
    } else {
      return '¡Felicidades! Has adivinado el número $guess.';
    }
  }
}