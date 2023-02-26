import 'package:flutter/material.dart';

class QuizFinishButton extends StatelessWidget {
  QuizFinishButton({required this.label, required this.function});
  final String label;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 50,
        width: 360,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ], color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
