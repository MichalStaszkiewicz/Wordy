import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/shared/consts.dart';

import '../Provider/interface_language_provider.dart';

class QuizNextButton extends StatelessWidget {
  QuizNextButton({required this.function});
  Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Consumer<InterfaceLanguageProvider>(
        builder: (context, value, child) => Container(
          margin: EdgeInsets.only(bottom: 50),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
                ui_lang[value.interfaceLangauge]!['quiz_next_button']
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
