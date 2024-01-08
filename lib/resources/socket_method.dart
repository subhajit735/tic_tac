import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/provider/room_data_provider.dart';
import 'package:tic_tac/resources/socket_client.dart';
import 'package:tic_tac/screen/game_screen.dart';
import 'package:tic_tac/utils/utils.dart';

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

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit(
        'joinRoom',
        {
          'nickname': nickname,
          'roomId': roomId,
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

  void joinRoomSuccesListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccured', (data) {
      showSnackBar(context, data.toString());
    });
  }
}
