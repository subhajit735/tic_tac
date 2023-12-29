import 'package:flutter/material.dart';
import 'package:tic_tac/responsive/responsive.dart';
import 'package:tic_tac/screen/create_room_screen.dart';
import 'package:tic_tac/screen/join_room_screen.dart';
import 'package:tic_tac/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinroom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(onTap: () => createRoom(context), text: "Create Room"),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onTap: () => joinroom(context), text: "Join Room"),
          ],
        ),
      ),
    );
  }
}
