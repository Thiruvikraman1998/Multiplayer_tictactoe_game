import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  final VoidCallback onPressedEvent;
  final String lable;
  const MainMenuButton(
      {super.key, required this.lable, required this.onPressedEvent});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressedEvent,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width, 50),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          shape: const BeveledRectangleBorder()),
      child: Text(
        lable,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
