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
      child: Consumer<InterfaceLanguageProvider>(builder:(context,value,child)=> Container(
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              ui_lang[value.interfaceLangauge]!['quiz_next_button'].toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
              
            ),
          ),
        ),
      
      ),
    );
  }
}
