import 'package:flutter/material.dart';
import 'package:wordy/shared/consts.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(ui_lang[userLanguage]!['exit_dialog_header'].toString()),
      content:
          Text(ui_lang[userLanguage]!['exit_dialog_description'].toString()),
      actions: <Widget>[
        OutlinedButton(
          child: Text(ui_lang[userLanguage]!['exit_dialog_no'].toString()),
          onPressed: () => Navigator.pop(context),
        ),
        OutlinedButton(
          child: Text(ui_lang[userLanguage]!['exit_dialog_yes'].toString()),
          onPressed: () =>
              Navigator.of(context).popUntil(ModalRoute.withName('/')),
        ),
      ],
    );
  }
}
