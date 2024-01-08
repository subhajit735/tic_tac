import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/provider/room_data_provider.dart';
import 'package:tic_tac/resources/socket_method.dart';

class TicTac extends StatefulWidget {
  const TicTac({super.key});

  @override
  State<TicTac> createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  SocketMethods _socketMethods = SocketMethods();

  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(index, roomDataProvider.roomData['_id'],
        roomDataProvider.displayElements);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.tapGridListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    final size = MediaQuery.of(context).size;
    print(_socketMethods.socketClient.id !=
        roomDataProvider.roomData['turn']['socketID']);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return AbsorbPointer(
              absorbing: _socketMethods.socketClient.id !=
                  roomDataProvider.roomData['turn']['socketID'],
              child: GestureDetector(
                onTap: () => tapped(index, roomDataProvider),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      roomDataProvider.displayElements[index],
                      style: TextStyle(
                        fontSize: 90,
                        shadows: [
                          Shadow(
                              blurRadius: 50,
                              color:
                                  roomDataProvider.displayElements[index] == 'X'
                                      ? Colors.blue
                                      : Colors.red),
                        ],
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
