import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  const CustomTextField(
      {super.key, required this.text, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 2,
            color: Colors.blue,
          ),
        ],
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 8, 8, 8),
          filled: true,
          hintText: text,
        ),
      ),
    );
  }
}
