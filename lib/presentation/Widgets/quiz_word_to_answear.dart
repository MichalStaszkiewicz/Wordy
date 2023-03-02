import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuizWordToAnswear extends StatelessWidget {
  QuizWordToAnswear({required this.word});
  String word;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Center(
        child: AutoSizeText(
          word,
          maxLines: 1,
          minFontSize: 15,
          maxFontSize: 20,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
