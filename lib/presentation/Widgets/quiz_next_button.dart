import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  QuizButton(
      {super.key, required this.function,
      required this.height,
      required this.width,
      required this.margin,
      required this.label});
  Function function;
  double height;
  double width;
  String label;
  EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          margin: margin,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(label,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white)),
          ),
        ));
  }
}
