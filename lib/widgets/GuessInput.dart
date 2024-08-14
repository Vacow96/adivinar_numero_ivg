

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/GameViewModel.dart';

class GuessInput extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Ingresa tu adivinanza'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              final guess = int.tryParse(_controller.text);
              if (guess != null) {
                final message = Provider.of<GameViewModel>(context, listen: false)
                    .makeGuess(guess);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            },
            child: Text('Adivinar'),
          ),
        ],
      ),
    );
  }
}