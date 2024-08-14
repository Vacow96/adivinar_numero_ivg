import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';

class GuessHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameViewModel>(context).game;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Mayor que: ${game.greaterGuesses.join(', ')}'),
            Text('Menor que: ${game.lesserGuesses.join(', ')}'),
          ],
        ),
      ),
    );
  }
}