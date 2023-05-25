import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/consts.dart';

class ExitDialog extends StatelessWidget {
  ExitDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(ui_lang['English']!['warning_dialog_header'].toString()),
      content: Text(ui_lang['English']!['exit_dialog_description'].toString()),
      actions: <Widget>[
        OutlinedButton(
          child: Text(ui_lang['English']!['dialog_no'].toString()),
          onPressed: () => Navigator.pop(context),
        ),
        OutlinedButton(
            child: Text(ui_lang['English']!['dialog_yes'].toString()),
            onPressed: () {
              context.go('/home');
            }),
      ],
    );
  }
}
