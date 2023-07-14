import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_game/provider/room_data_provider.dart';
import 'package:tictactoe_game/resources/socket_io.dart';
import 'package:tictactoe_game/screens/game_screen.dart';
import 'package:tictactoe_game/utils/snackbar.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance!.socket!;

  //Emit methods
  void createRoom(BuildContext context, String name) {
    if (name.isNotEmpty) {
      _socketClient.emit("createRoom", {'name': name});
      return;
    } else if (name.isEmpty) {
      showSnackBar(context, "Name is Empty, enter a name");
    }
  }

  void joinRoom(String name, String roomId) {
    if (name.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit("joinRoom", {
        'name': name,
        'roomId': roomId,
      });
    }
  }

  //Listener methods
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on("CreateRoomSuccess!", (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on("joinRoomSuccess!", (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorListener(BuildContext context) {
    _socketClient.on("error", (errorMessage) {
      showSnackBar(context, errorMessage);
    });
  }

  void updatePlayerStateListener(BuildContext context) {
    _socketClient.on("updatePlayers", (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClient.on("updateRoom", (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomData(data);
    });
  }
}
