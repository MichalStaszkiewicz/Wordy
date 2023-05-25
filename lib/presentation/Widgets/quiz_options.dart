import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/widgets/menu_button.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/const/consts.dart';

class QuizOptions extends StatefulWidget {
  final String title;

  QuizOptions({required this.title});

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
          AutoSizeText(widget.title,
              maxLines: 2,
              maxFontSize: 20,
              minFontSize: 15,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          MenuButton(
            label: ui_lang['English']!['quiz_settings_review'].toString(),
            function: () {},
          ),
          MenuButton(
            label: ui_lang['English']!['quiz_settings_learn'].toString(),
            function: () {},
          ),
        ],
      ),
    );
  }
}
