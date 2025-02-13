import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showAlertDialog(context),
      child: const Text('Show Dialog'),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('You are about to sign out'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              ),
                TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              )
            ]
          );
        }
      );
  }
}