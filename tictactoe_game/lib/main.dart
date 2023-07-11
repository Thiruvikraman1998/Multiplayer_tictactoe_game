import 'package:flutter/material.dart';
import 'package:tictactoe_game/screens/main_menu_screen.dart';
import 'package:tictactoe_game/utils/colors.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: bgColor, useMaterial3: true),
      home: const MainMenu(),
    );
  }
}
