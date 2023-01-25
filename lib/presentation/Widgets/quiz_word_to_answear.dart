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
        child: Text(
          word,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
