import 'package:adivinar_numero_ivg/views/GameView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';
import '../widgets/DifficultyButton.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Adivinar el Número',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Seleccione un nivel de dificultad:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              DifficultyButton(
                text: 'Fácil',
                color: Colors.green,
                onPressed: () {
                  viewModel.setDifficulty(Difficulty.easy);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameView()),
                  );
                },
              ),
              DifficultyButton(
                text: 'Medio',
                color: Colors.blue,
                onPressed: () {
                  viewModel.setDifficulty(Difficulty.medium);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameView()),
                  );
                },
              ),
              DifficultyButton(
                text: 'Avanzado',
                color: Colors.orange,
                onPressed: () {
                  viewModel.setDifficulty(Difficulty.hard);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameView()),
                  );
                },
              ),
              DifficultyButton(
                text: 'Extremo',
                color: Colors.red,
                onPressed: () {
                  viewModel.setDifficulty(Difficulty.extreme);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}