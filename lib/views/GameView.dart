import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';
import '../widgets/DifficultySelector.dart';
import '../widgets/GuessHistory.dart';
import '../widgets/GuessInput.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Juego de Adivinanza'),
        ),
        body: Column(
          children: [
            DifficultySelector(),
            GuessInput(),
            GuessHistory(),
          ],
        ),
      ),
    );
  }
}