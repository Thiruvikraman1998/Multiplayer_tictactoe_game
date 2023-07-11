import 'package:flutter/material.dart';
import 'package:tictactoe_game/widgets/buttons/main_menu_buttons.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainMenuButton(onPressedEvent: () {}, lable: "Create Room"),
          MainMenuButton(onPressedEvent: () {}, lable: "Join Room")
        ],
      ),
    );
  }
}
