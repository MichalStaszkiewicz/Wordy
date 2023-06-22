import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/domain/models/beginner.dart';
import 'package:wordy/presentation/bloc/quiz/quiz_bloc.dart';

class QuizButton extends StatefulWidget {
  QuizButton(
      {super.key,
      required this.function,
      required this.height,
      required this.width,
      required this.margin,
      required this.label,
      required this.selectedAnswer});
  bool? selectedAnswer;
  Function function;
  double height;
  double width;
  String label;
  EdgeInsets margin;

  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _buttonColorAnimationFirstColor;
  late Animation<Color?> _buttonColorAnimationSecondColor;
  late Animation<Color?> _textColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _buttonColorAnimationFirstColor = ColorTween(
            begin: widget.selectedAnswer == true
                ? Color.fromARGB(255, 99, 155, 252)
                : Colors.white,
            end: widget.selectedAnswer == true
                ? Colors.white
                : Color.fromARGB(255, 99, 155, 252))
        .animate(_animationController);
    _buttonColorAnimationSecondColor = ColorTween(
      begin: widget.selectedAnswer == true
          ? Color.fromRGBO(158, 149, 248, 1)
          : Colors.white,
      end: widget.selectedAnswer == true
          ? Colors.white
          : Color.fromRGBO(158, 149, 248, 1),
    ).animate(_animationController);
    _textColorAnimation = ColorTween(
      begin: widget.selectedAnswer == true ? Colors.white : Colors.indigoAccent,
      end: widget.selectedAnswer == true ? Colors.white : Colors.white,
    ).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant QuizButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedAnswer != oldWidget.selectedAnswer) {
      if (widget.selectedAnswer == true) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 99, 155, 252),
                  Color.fromRGBO(158, 149, 248, 1),
                ])),
            child: Center(
              child: Container(
                margin: widget.margin,
                width: widget.width - 2,
                height: widget.height - 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(colors: [
                    _buttonColorAnimationFirstColor.value!,
                    _buttonColorAnimationSecondColor.value!
                  ]),
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: _textColorAnimation.value,
                          fontSize: 15,
                          letterSpacing: 3,
                        ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
