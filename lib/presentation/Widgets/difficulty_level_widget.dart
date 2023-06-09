import 'package:flutter/material.dart';

class DifficultyLevelWidget extends StatelessWidget {
  DifficultyLevelWidget(
      {super.key, required this.textColor,
      required this.widgetColor,
      required this.label});
  Color widgetColor;
  Color textColor;
  String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widgetColor, borderRadius: BorderRadius.circular(20)),
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
