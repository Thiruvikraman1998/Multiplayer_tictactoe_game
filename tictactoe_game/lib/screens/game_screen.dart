import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_game/provider/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game_room';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    String data = Provider.of<RoomDataProvider>(context).roomData.toString();
    return Scaffold(
      body: Center(
        child: Text(data),
      ),
    );
  }
}
