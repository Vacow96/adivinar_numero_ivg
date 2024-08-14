
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';

class DifficultySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['Fácil', 'Medio', 'Avanzado', 'Extremo'].map((difficulty) {
        return ElevatedButton(
          onPressed: () {
            Provider.of<GameViewModel>(context, listen: false)
                .setDifficulty(difficulty);
          },
          child: Text(difficulty),
        );
      }).toList(),
    );
  }
}