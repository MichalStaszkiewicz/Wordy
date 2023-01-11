import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:wordy/QuizScreen/quiz_screen.dart';
import 'package:wordy/TopicScreen/menu_button.dart';

class QuizOptions extends StatefulWidget {
  final String topicName;

  QuizOptions({required this.topicName});

  @override
  State<QuizOptions> createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late Tween<double> _sizeAnimation;
  @override
  void initState() {
    _sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _sizeAnimation = Tween<double>(begin: 100, end: 200);

    super.initState();
  }

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(10),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.topicName, style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          MenuButton(
            label: 'Review',
            function: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QuizScreen(topic: widget.topicName)));
            },
          ),
          MenuButton(
            label: 'Learn',
            function: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QuizScreen(topic: widget.topicName)));
            },
          ),
        ],
      ),
    );
  }
}
