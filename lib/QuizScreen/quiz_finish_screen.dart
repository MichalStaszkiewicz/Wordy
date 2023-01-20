import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Bloc/topics/topics_bloc.dart';
import 'package:wordy/QuizScreen/quiz_finish_button.dart';
import 'package:wordy/QuizScreen/quiz_screen.dart';
import 'package:wordy/TopicScreen/topic_screen.dart';

class QuizFinishScreen extends StatefulWidget {
  QuizFinishScreen(
      {required this.topic, required this.correct, required this.maximum});
  String topic;
  int correct;
  int maximum;

  @override
  State<QuizFinishScreen> createState() => _QuizFinishScreenState();
}

class _QuizFinishScreenState extends State<QuizFinishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Summary",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),  
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    widget.topic,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 100,
                      child: Image(image: AssetImage('assets/dailyusage.png'))),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      "Your Score",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    Text(
                                      "${widget.correct} / ${widget.maximum}",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: AutoSizeText(
                                maxLines: 1,
                                "Percentage of the correct answears: ${(widget.correct / widget.maximum) * 100}%",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          QuizFinishButton(
            function: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => QuizScreen(
                        topic: widget.topic,
                      ))));
            },
            label: 'Repeat Quiz',
          ),
          const SizedBox(
            height: 20,
          ),
          QuizFinishButton(
            function: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
            label: 'Home',
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
