import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String cont) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(cont),
    ),
  );

  void showGameDialog(BuildContext context, String text) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  // GameMethods().clearBoard(context);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Play Again',
                ),
              ),
            ],
          );
        });
  }
}
