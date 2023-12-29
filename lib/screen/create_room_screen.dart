import 'package:flutter/material.dart';
import 'package:tic_tac/responsive/responsive.dart';
import 'package:tic_tac/widgets/custom_button.dart';
import 'package:tic_tac/widgets/custom_text.dart';
import 'package:tic_tac/widgets/custom_textField.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = "/create-room";
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
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
              CustomText(
                fontsize: 60,
                shadow: [
                  Shadow(
                    blurRadius: 20,
                    color: Colors.blue,
                  ),
                ],
                text: "Create Room",
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                  text: "Create room Id",
                  textEditingController: _nameController),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomButton(onTap: () {}, text: "Create"),
            ],
          ),
        ),
      ),
    );
  }
}