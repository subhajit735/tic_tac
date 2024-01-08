import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/provider/room_data_provider.dart';
import 'package:tic_tac/resources/socket_client.dart';
import 'package:tic_tac/screen/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  //emit
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


//listener
  void createRoomSuccesListener(BuildContext context) {
    _socketClient.on('CreateRoomSuccess', (room) {
      print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
