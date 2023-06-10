import 'package:flutter/material.dart';

class DifficultyLevelWidget extends StatelessWidget {
  DifficultyLevelWidget(
      {super.key, required this.textColor, required this.label});

  Color textColor;
  String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 99, 155, 252),
              Color.fromRGBO(158, 149, 248, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20)),
      height: 25,
      width: 100,
      child: Center(
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
