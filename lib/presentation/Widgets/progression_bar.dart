import 'package:flutter/material.dart';

class ProgressionBar extends StatelessWidget {
  ProgressionBar(
      {super.key,
      required this.progress,
      required this.width,
      required this.gradient,
      required this.nonProgressionColor,
      required this.height});
  List<Color> gradient;
  double progress;
  double width;
  double height;
  Color nonProgressionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: nonProgressionColor, borderRadius: BorderRadius.circular(20)),
      width: width,
      alignment: Alignment.topLeft,
      child: Container(
        width: (progress / 100) * width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
