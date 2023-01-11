import 'package:flutter/material.dart';
import 'package:wordy/QuizScreen/exit_dialog.dart';

import 'package:wordy/QuizScreen/quiz_next_button.dart';
import 'package:wordy/QuizScreen/quiz_word_to_answear.dart';

import 'answears_column.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({required this.topic});
  String topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
   Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExitDialog();
      },
    ) ??
        false;
  }

  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.only(right: 40),
            child: Center(
              child: Text(widget.topic,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white)),
            ),
          ),
        ),
        body: Center(
          child:
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              height: 60,
            ),
            Expanded(
              flex: 2,
              child: QuizWordToAnswear(
                word: "Success",
              ),
            ),
            Expanded(
              flex: 4,
              child: AnswearsColumn(
                answears: const ["sukces", "sukces", "sukces", "sukces"],
              ),
            ),
            const Expanded(
              flex: 1,
              child: QuizNextButton(),
            )
          ]),
        ),
      ),
    );
  }
}
