import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Uwaga!'),
      content: Text('Czy na pewno chcesz wyjść? Jeśli tak, utracisz postęp.'),
      actions: <Widget>[
        OutlinedButton(
          child: Text('Nie'),
          onPressed: () => Navigator.pop(context),
        ),
        OutlinedButton(
          child: Text('Tak'),
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
        ),
      ],
    );
  }
}
