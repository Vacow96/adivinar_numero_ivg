import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';


class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinar el Número'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: viewModel.resetGame,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Adivina el número secreto',
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: viewModel.guessController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese su conjetura',
                errorText: viewModel.inputError,
              ),
            ),
            ElevatedButton(
              onPressed: viewModel.makeGuess,
              child: Text('Adivinar'),
            ),
            Expanded(
              child: ListView(
                children: viewModel.guesses.map((guess) {
                  final result = viewModel.guessResults[viewModel.guesses.indexOf(guess)];
                  return ListTile(
                    title: Text(
                      guess.toString(),
                      style: TextStyle(color: result ? Colors.green : Colors.red),
                    ),
                  );
                }).toList(),
              ),
            ),
            Text(
              viewModel.resultMessage,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}