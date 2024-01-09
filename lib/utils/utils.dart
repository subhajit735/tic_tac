import 'package:flutter/material.dart';
import 'package:tic_tac/game_element/check_winner.dart';

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

void gamedialogbox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              GameMethods().clearscreen(context);
              Navigator.pop(context);
            },
            child: Text('PlayAgain'),
          ),
        ],
      );
    },
  );
}
