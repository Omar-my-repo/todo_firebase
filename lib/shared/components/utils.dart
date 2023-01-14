import 'package:flutter/material.dart';

void sowMessage(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  hideDialog(context); //for hiding dialog
                  hideDialog(context); //for removing modal sheet
                },
                child: const Text('OK'))
          ],
        );
      });
}

void hideDialog(BuildContext context) {
  Navigator.pop(context);
}

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text('Loading...')
            ],
          ),
        );
      });
}
