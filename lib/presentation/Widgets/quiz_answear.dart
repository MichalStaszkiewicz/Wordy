import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';

class QuizAnswear extends StatefulWidget {
  QuizAnswear({
    super.key,
    required this.answer,
    required this.index,
  });
  String answer;
  int index;

  @override
  State<QuizAnswear> createState() => _QuizAnswearState();
}

class _QuizAnswearState extends State<QuizAnswear> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is BeginnerQuizLoaded) {
          return GestureDetector(
            onTap: () {
              if (!state.answerChecked) {
                context
                    .read<QuizBloc>()
                    .add(SelectAnswer(selectedIndex: widget.index));
              }
            },
            child: Container(
              height: 250,
              width: 250,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: state.selectedIndex == widget.index
                      ? [
                          Color.fromARGB(255, 99, 155, 252),
                          Color.fromRGBO(158, 149, 248, 1),
                        ]
                      : [Colors.white, Colors.white], // kolory gradientu
                  begin: Alignment.topLeft, // początek gradientu
                  end: Alignment.bottomRight, // koniec gradientu
                ),
                border: Border.all(
                  width: 3,
                  style: BorderStyle.solid,
                  color: Colors.transparent, // kolor przezroczysty
                ),
                borderRadius:
                    BorderRadius.circular(10), // zaokrąglenie krawędzi
              ),
              child: Container(
                height: 200,
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
            ),
          );
        } else {
          return const LoadingData();
        }
      },
    );
  }
}
