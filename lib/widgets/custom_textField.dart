import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  bool isReadonly;
  CustomTextField({
    super.key,
    required this.text,
    required this.textEditingController,
    this.isReadonly = false,
  });

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
        readOnly: isReadonly,
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
