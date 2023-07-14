import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_game/provider/room_data_provider.dart';
import 'package:tictactoe_game/widgets/custom_textfield.dart';

class WatitingLobby extends StatefulWidget {
  const WatitingLobby({super.key});

  @override
  State<WatitingLobby> createState() => _WatitingLobbyState();
}

class _WatitingLobbyState extends State<WatitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
        text:
            "Room ID: ${Provider.of<RoomDataProvider>(context, listen: false).roomData['_id']}");
  }

  @override
  void dispose() {
    roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Waiting for Player to join'),
        const SizedBox(height: 20),
        CustomTextField(
            hintText: "", controller: roomIdController, isReadOnly: true)
      ],
    );
  }
}
