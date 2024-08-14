import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/GameViewModel.dart';
import 'views/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameViewModel(),
      child: MaterialApp(
        title: 'Adivinar el Número',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}