import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/provider/room_data_provider.dart';
import 'package:tic_tac/widgets/custom_textField.dart';

class WaitingLobby extends StatefulWidget {
  WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    roomIdcontroller = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Waiting for a player to join..."),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          text: roomIdcontroller.text,
          textEditingController: roomIdcontroller,
          isReadonly: true,
        ),
      ],
    );
  }
}
