import 'package:flutter/material.dart';
import 'package:tictactoe_game/responsive/responsive.dart';
import 'package:tictactoe_game/screens/create_room_screen.dart';
import 'package:tictactoe_game/screens/join_room_screen.dart';
import 'package:tictactoe_game/widgets/buttons/main_menu_buttons.dart';

class MainMenu extends StatelessWidget {
  static String routeName = "/main_menu";
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainMenuButton(
                  onPressedEvent: () {
                    Navigator.pushNamed(context, CreateRoom.routeName);
                  },
                  lable: "Create Room"),
              const SizedBox(height: 30),
              MainMenuButton(
                  onPressedEvent: () {
                    Navigator.pushNamed(context, JoinRoom.routeName);
                  },
                  lable: "Join Room")
            ],
          ),
        ),
      ),
    );
  }
}
