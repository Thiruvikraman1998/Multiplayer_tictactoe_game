import 'package:tictactoe_game/resources/socket_io.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String name) {
    _socketClient.emit("createRoom", {'name': name});
  }
}
