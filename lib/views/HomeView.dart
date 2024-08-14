import 'package:adivinar_numero_ivg/views/GameView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Adivinar el Número')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Seleccione un nivel de dificultad:'),
            ElevatedButton(
              onPressed: () {
                viewModel.setDifficulty(Difficulty.easy);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameView()),
                );
              },
              child: Text('Fácil'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.setDifficulty(Difficulty.medium);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameView()),
                );
              },
              child: Text('Medio'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.setDifficulty(Difficulty.hard);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameView()),
                );
              },
              child: Text('Avanzado'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.setDifficulty(Difficulty.extreme);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameView()),
                );
              },
              child: Text('Extremo'),
            ),
          ],
        ),
      ),
    );
  }
}