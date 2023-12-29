import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  CustomButton({super.key, txt, required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 23,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 50),
      ),
    );
  }
}
