import 'package:flutter/material.dart';
import 'package:wordy/shared/consts.dart';

class QuizNextButton extends StatelessWidget {
  QuizNextButton({required this.function});
  Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            ui_lang[userLanguage]!['quiz_next_button'].toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
            
          ),
        ),
      ),
    );
  }
}
