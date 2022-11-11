import 'package:flutter/material.dart';

Future<bool> showErrorDialog(
  BuildContext context,
  String message,
) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Okay"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
