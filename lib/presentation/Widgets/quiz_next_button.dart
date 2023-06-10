import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  QuizButton(
      {super.key,
      required this.function,
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
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 99, 155, 252),
                Color.fromRGBO(158, 149, 248, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white, fontSize: 15)),
          ),
        ));
  }
}
