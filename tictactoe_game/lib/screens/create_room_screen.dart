import 'package:flutter/material.dart';
import 'package:tictactoe_game/responsive/responsive.dart';
import 'package:tictactoe_game/widgets/buttons/main_menu_buttons.dart';
import 'package:tictactoe_game/widgets/custom_text.dart';
import 'package:tictactoe_game/widgets/custom_textfield.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = '/create_room';
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                  text: 'Create Room',
                  fontSize: 70),
              SizedBox(height: size.height * 0.05),
              CustomTextField(
                  hintText: 'Enter your name', controller: _nameController),
              SizedBox(height: size.height * 0.05),
              MainMenuButton(lable: 'Create', onPressedEvent: () {})
            ],
          ),
        ),
      ),
    );
  }
}
