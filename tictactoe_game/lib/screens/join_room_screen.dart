import 'package:flutter/material.dart';
import 'package:tictactoe_game/resources/socket_methods.dart';

import '../responsive/responsive.dart';
import '../widgets/buttons/main_menu_buttons.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class JoinRoom extends StatefulWidget {
  static String routeName = '/join_room';
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorListener(context);
    _socketMethods.updatePlayerStateListener(context);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _gameIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                  shadows: [Shadow(blurRadius: 40, color: Colors.amber)],
                  text: 'Join Room',
                  fontSize: 80),
              SizedBox(height: size.height * 0.05),
              CustomTextField(
                  hintText: 'Enter your name', controller: _nameController),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                  hintText: 'Enter Game Id', controller: _gameIdController),
              SizedBox(height: size.height * 0.05),
              MainMenuButton(
                  lable: 'Join',
                  onPressedEvent: () {
                    _socketMethods.joinRoom(
                        _nameController.text, _gameIdController.text);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
