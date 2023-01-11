
import'package:flutter/material.dart';
import 'package:wordy/QuizScreen/quiz_answear.dart';
class AnswearsColumn extends StatelessWidget {
  AnswearsColumn({required this.answears});
 final List<String> answears;

  @override
  Widget build(BuildContext context) {
    return Container(
           
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: QuizAnswear(
                  answear: answears[0],
                ),
              ),
              Expanded(
                child: QuizAnswear(
                  answear: answears[1],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: QuizAnswear(
                  answear: answears[2],
                ),
              ),
              Expanded(
                child: QuizAnswear(
                  answear: answears[3],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
