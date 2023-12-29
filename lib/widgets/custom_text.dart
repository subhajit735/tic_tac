import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.fontsize,
      required this.shadow,
      required this.text});
  final List<Shadow> shadow;
  final String text;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
        shadows: shadow,
      ),
    );
  }
}
