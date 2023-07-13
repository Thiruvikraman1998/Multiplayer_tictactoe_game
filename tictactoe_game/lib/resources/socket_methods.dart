import 'package:flutter/foundation.dart';
import 'package:tictactoe_game/resources/socket_io.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance!.socket!;

  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClient.emit("createRoom", {'name': name});
    }
    debugPrint("$name printed from method");
  }
}
