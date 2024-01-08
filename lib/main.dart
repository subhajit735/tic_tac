import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/provider/room_data_provider.dart';
import 'package:tic_tac/screen/create_room_screen.dart';
import 'package:tic_tac/screen/game_screen.dart';
import 'package:tic_tac/screen/join_room_screen.dart';
import 'package:tic_tac/screen/main_menu_screen.dart';
import 'package:tic_tac/utils/colors.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgcol,
        ),
        initialRoute: MainMenuScreen.routeName,
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          GameScreen.routeName:(context) => const GameScreen(),
        },
      ),
    );
  }
}
