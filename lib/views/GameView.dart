import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/GameViewModel.dart';

class GameView extends StatelessWidget {
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
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: viewModel.resetGame,
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Adivina el número secreto',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            TextField(
              controller: viewModel.guessController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese su número',
                labelStyle: TextStyle(color: Colors.deepPurple),
                border: OutlineInputBorder(),
                errorText: viewModel.inputError,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: viewModel.makeGuess,
              child: Text(
                  'Adivinar',
                  style: TextStyle(
                      fontSize: 18,
                    color: Colors.white
                  )
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Card(
                elevation: 4,
                margin: EdgeInsets.only(top: 16),
                child: ListView(
                  children: viewModel.guesses.map((guess) {
                    final result = viewModel.guessResults[viewModel.guesses.indexOf(guess)];
                    return ListTile(
                      title: Text(
                        guess.toString(),
                        style: TextStyle(
                          color: result ? Colors.green : Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      leading: Icon(
                        result ? Icons.check_circle : Icons.cancel,
                        color: result ? Colors.green : Colors.red,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              viewModel.resultMessage,
              style: TextStyle(fontSize: 18, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}