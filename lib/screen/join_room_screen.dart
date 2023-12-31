import 'package:flutter/material.dart';
import 'package:tic_tac/responsive/responsive.dart';
import 'package:tic_tac/widgets/custom_button.dart';
import 'package:tic_tac/widgets/custom_text.dart';
import 'package:tic_tac/widgets/custom_textField.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = "/join-room";
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIDcontroller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIDcontroller.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                fontsize: 60,
                shadow: [
                  Shadow(
                    blurRadius: 20,
                    color: Colors.blue,
                  ),
                ],
                text: "Join Room",
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                  text: "Enter your Nickname",
                  textEditingController: _gameIDcontroller),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomTextField(
                  text: "Enter Game ID",
                  textEditingController: _nameController),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomButton(onTap: () {}, text: "Join"),
            ],
          ),
        ),
      ),
    );
  }
}
