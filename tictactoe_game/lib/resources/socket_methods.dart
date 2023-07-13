import 'package:flutter/material.dart';
import 'package:tictactoe_game/resources/socket_io.dart';
import 'package:tictactoe_game/screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance!.socket!;

  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClient.emit("createRoom", {'name': name});
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on("CreateRoomSuccess!", (room) {
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
