import 'package:flutter/material.dart';

class ProgressionBar extends StatelessWidget {
  ProgressionBar({
    super.key,
    required this.progress,
    required this.width,
  });

  double progress;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 232, 243),
          borderRadius: BorderRadius.circular(20)),
      width: width,
      alignment: Alignment.topLeft,
      child: Container(
        width: (progress / 100) * width,
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
      ),
    );
  }
}
