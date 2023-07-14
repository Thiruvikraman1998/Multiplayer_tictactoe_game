import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_game/provider/room_data_provider.dart';
import 'package:tictactoe_game/resources/socket_methods.dart';
import 'package:tictactoe_game/widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game_room';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    String data = Provider.of<RoomDataProvider>(context).roomData.toString();
    return Scaffold(
      body: Center(
        child: roomDataProvider.roomData['isJoin']
            ? const WatitingLobby()
            : Text(data),
      ),
    );
  }
}
