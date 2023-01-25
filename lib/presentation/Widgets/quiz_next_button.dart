import 'package:flutter/material.dart';

class QuizNextButton extends StatelessWidget {
QuizNextButton({required this.function});
Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
function();
      },
      child: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            "Next",
            style:
                Theme.of(context).textTheme.headline5!.copyWith(letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
