import 'package:flutter/material.dart';
import 'package:tic_tac/resources/socket_client.dart';
import 'package:tic_tac/screen/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit(
        'createRoom',
        {
          'nickname': nickname,
        },
      );
    }
  }

  void createRoomSuccesListener(BuildContext context) {
    _socketClient.on('CreateRoomSuccess', (room) {
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
