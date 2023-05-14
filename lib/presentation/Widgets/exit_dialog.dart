import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/provider/interface_language_provider.dart';
import 'package:wordy/const/consts.dart';

class ExitDialog extends StatelessWidget {
  ExitDialog();

  @override
  Widget build(BuildContext context) {
    return Consumer<InterfaceDataProvider>(
      builder: (context, value, child) => AlertDialog(
        title: Text(ui_lang[value.interfaceLangauge]!['warning_dialog_header']
            .toString()),
        content: Text(
            ui_lang[value.interfaceLangauge]!['exit_dialog_description']
                .toString()),
        actions: <Widget>[
          OutlinedButton(
            child:
                Text(ui_lang[value.interfaceLangauge]!['dialog_no'].toString()),
            onPressed: () => Navigator.pop(context),
          ),
          OutlinedButton(
              child: Text(
                  ui_lang[value.interfaceLangauge]!['dialog_yes'].toString()),
              onPressed: () {
            
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }),
        ],
      ),
    );
  }
}
