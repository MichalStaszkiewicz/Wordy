import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:wordy/const/consts.dart';

class UnexpectedError extends StatelessWidget {
  UnexpectedError();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(ui_lang['English']!['unexpected_error'].toString()),
    );
  }
}
