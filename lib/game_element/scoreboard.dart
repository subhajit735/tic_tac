import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/provider/room_data_provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                roomDataProvider.player1.nickname,
                style: TextStyle(fontSize: 30),
              ),
              Text(
                roomDataProvider.player1.points.toInt().toString(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                roomDataProvider.player2.nickname,
                style: TextStyle(fontSize: 30),
              ),
              Text(
                roomDataProvider.player2.points.toInt().toString(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
