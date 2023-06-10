import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';

class QuizAnswear extends StatefulWidget {
  QuizAnswear({super.key, required this.answer, required this.index});
  String answer;
  int index;

  @override
  State<QuizAnswear> createState() => _QuizAnswearState();
}

class _QuizAnswearState extends State<QuizAnswear> {
  Color colorCheck(int? selectedIndex, int correctIndex) {
    if (selectedIndex != correctIndex && selectedIndex == widget.index) {
      return Colors.red;
    }
    if ((selectedIndex == correctIndex && selectedIndex == widget.index) ||
        widget.index == correctIndex && selectedIndex != null) {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is BeginnerQuizLoaded) {
          return GestureDetector(
            onTap: () {
              if (state.selectedIndex == null) {
                context
                    .read<QuizBloc>()
                    .add(SelectAnswer(selectedIndex: widget.index));
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 150,
              decoration: BoxDecoration(
                color: colorCheck(
                    state.selectedIndex,
                    state.questions[state.currentQuestionIndex]
                        .correctAnswerIndex),
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
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: AutoSizeText(
                    widget.answer,
                    maxLines: 1,
                    minFontSize: 15,
                    maxFontSize: 20,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
          );
        } else {
          return const LoadingData();
        }
      },
    );
  }
}
