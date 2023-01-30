
import 'package:flutter/cupertino.dart';
import 'package:wordy/shared/consts.dart';

class UnexpectedError extends StatelessWidget {
UnexpectedError();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(ui_lang[userLanguage]!['unexpected_error'].toString()),
    );
  }
}
