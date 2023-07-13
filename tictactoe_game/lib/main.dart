import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_game/provider/room_data_provider.dart';
import 'package:tictactoe_game/screens/create_room_screen.dart';
import 'package:tictactoe_game/screens/game_screen.dart';
import 'package:tictactoe_game/screens/join_room_screen.dart';
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
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: bgColor, useMaterial3: true),
        routes: {
          MainMenu.routeName: (context) => const MainMenu(),
          CreateRoom.routeName: (context) => const CreateRoom(),
          JoinRoom.routeName: (context) => const JoinRoom(),
          GameScreen.routeName: (context) => const GameScreen()
        },
        initialRoute: MainMenu.routeName,
      ),
    );
  }
}
