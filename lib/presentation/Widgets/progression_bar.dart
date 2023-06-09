import 'package:flutter/material.dart';

class ProgressionBar extends StatelessWidget {
  ProgressionBar({super.key, 
    required this.progress,
    required this.progressColor,
    required this.width,
  });
  Color progressColor;
  double progress;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      width: width,
      alignment: Alignment.topLeft,
      child: Container(
        width: (progress / 100) * width,
        decoration: BoxDecoration(
            color: progressColor, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
